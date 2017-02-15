#!/bin/bash

PREFIX=
MAJOR_VERSION=
MINOR_VERSION=
BUILD_VERSION=
REVISION=

for tag in $(git for-each-ref --sort=taggerdate --format '%(refname)' refs/tags | sed 's~^refs/tags/~~' | tac); do

	if [[ "$tag" =~ ^([a-z\.]+)([0-9]+)\.([0-9]+)\.([0-9]+)-?([0-9]+)?(_[a-z]+[0-9]+)?$ ]]; then

		ACTUAL_VERSION=$tag
		PREFIX=${BASH_REMATCH[1]}
		MAJOR_VERSION=${BASH_REMATCH[2]}
		MINOR_VERSION=${BASH_REMATCH[3]}
		BUILD_VERSION=${BASH_REMATCH[4]}
		[[ "${BASH_REMATCH[5]}" != _* ]] && REVISION=${BASH_REMATCH[5]}
		break

	fi
done

echo
echo "Actual version: $ACTUAL_VERSION"
echo
echo "Choose next version number:"
echo

if [ "$REVISION" ]; then

	printf "(1) Next revision:\t\t"
	TMP=$((REVISION+1))
	NEXT_REVISION=$PREFIX$MAJOR_VERSION.$MINOR_VERSION.${BUILD_VERSION}-$TMP

else

	printf "(1) New revision:\t\t"
	NEXT_REVISION=$PREFIX$MAJOR_VERSION.$MINOR_VERSION.${BUILD_VERSION}-1

fi

echo $NEXT_REVISION

TMP=$((BUILD_VERSION+1))
NEXT_BUILD_VERSION=$PREFIX$MAJOR_VERSION.$MINOR_VERSION.$TMP
echo -e "(2) Next build version:\t\t$NEXT_BUILD_VERSION"

TMP=$((MINOR_VERSION+1))
NEXT_MINOR_VERSION=$PREFIX$MAJOR_VERSION.$TMP.0
echo -e "(3) Next minor version:\t\t$NEXT_MINOR_VERSION"

TMP=$((MAJOR_VERSION+1))
NEXT_MAJOR_VERSION=$PREFIX$TMP.0.0
echo -e "(4) Next major version:\t\t$NEXT_MAJOR_VERSION"

echo
printf "> "
read -n1 CHOISE
echo

case $CHOISE in
	1) NEW_TAG=$NEXT_REVISION;;
	2) NEW_TAG=$NEXT_BUILD_VERSION;;
	3) NEW_TAG=$NEXT_MINOR_VERSION;;
	4) NEW_TAG=$NEXT_MAJOR_VERSION;;
	*) echo; echo "Wrong choise!"; exit 1;;
esac

echo
echo "Do you want to edit tag message? (y/N)"
echo "Otherwise will be use tag message: $NEW_TAG"
echo
printf "> "
read -n1 CHOISE

case $CHOISE in
	n|N) git tag -a $NEW_TAG -m $NEW_TAG;;
	y|Y|*) git tag -a $NEW_TAG;;
esac

echo
echo

if [ $? -eq 0 ]; then

	git push --tags

fi
