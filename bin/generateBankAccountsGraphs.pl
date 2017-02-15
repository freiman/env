#! /usr/bin/perl

use warnings;
use strict;
use File::Find;
use Data::Dumper;
use DateTime::Format::Strptime;
use Chart::Gnuplot;

my $strp = DateTime::Format::Strptime->new(
	pattern => '%d. %m. %Y %R',
	time_zone => 'local',
);


my $thunderbirdDir = "/home/freiman/.thunderbird/";
my @inboxFiles;

find(sub {push(\@inboxFiles, $File::Find::name) if ("Inbox" eq $_) and -f}, $thunderbirdDir);

my %accounts;

for my $inboxFile (@inboxFiles) {

	for (split /\n{2,}/, `grep --no-group-separator -A 3 'dne .* je na Va.*' $inboxFile`) {

		my ($datetime, $account, $actual, $available) = (/dne ([0-9]+. [0-9]+. [0-9]+ [0-9]+:[0-9]+) je na Va=9Aem =FA=E8tu =E8=EDslo ([0-9]+)\naktu=E1ln=ED z=F9statek [+-]([0-9]+,[0-9]+) CZK\ndisponibiln=ED z=F9statek [+-]([0-9]+,[0-9]+) CZK/);

		my $dt = $strp->parse_datetime($datetime);

		$accounts{$account}->{"actual"}->{$dt->epoch} = $actual;
		$accounts{$account}->{"available"}->{$dt->epoch} = $available;

	}
}

for my $account (keys(\%accounts)) {

	for my $type (keys(%{$accounts{$account}})) {

		my $chart = Chart::Gnuplot->new(
			bg => "white",
			timeaxis => "x",
			ytics => {labelfmt => "%.0f"},
			output => "./$account-$type.png"
		);

		my @xdata;
		my @ydata;

		for my $t (sort(keys(%{$accounts{$account}->{$type}}))) {
			push(@xdata, $t);
			push(@ydata, $accounts{$account}->{$type}->{$t});
		}

		my $dataSet = Chart::Gnuplot::DataSet->new(
			style => "lines",
			timefmt => "%s",
			xdata => \@xdata,
			ydata => \@ydata
		);

		$chart->plot2d($dataSet);

	}
}

