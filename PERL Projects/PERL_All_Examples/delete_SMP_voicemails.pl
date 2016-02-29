#! /usr/local/bin/perl

use XML::Simple;
use LWP::UserAgent;
use HTTP::Headers;
use HTTP::Request::Common qw(DELETE GET POST PUT);
use Data::Dumper;
use XML::Parser;

my $debug = 0;
my $SERVER = 'ucx-am401-mtv';
my $AUTHUSER = 'smp.softoken.gen';
my $AUTHPASS = 'Cisco!123';

my @messageids;
my $get = getMessages();

foreach $id (@messageids) {
	deleteMessages($id);
}
 
exit;


sub getMessages {

	@folders = ('inbox','sent');
	foreach $folder (@folders ) {
	my $url="http://$SERVER/vmrest/mailbox/folders/$folder/messages?rowsperpage=250";
	print "  Searching Messages in: $folder\n";

	my $ua = LWP::UserAgent->new;
	my $header = HTTP::Headers->new;
	$header->header("Accept","application/xml");
	my $req = HTTP::Request->new(GET => $url, $header);

	$req->authorization_basic($AUTHUSER,$AUTHPASS);
	my $response = $ua->request($req);
		if ($response->is_success) {
			$xml = new XML::Simple (KeyAttr=>[]);
			$data = $xml->XMLin($response->decoded_content, ForceArray => 1);
			@mydata = @{$data->{Message}};

			foreach $e (@mydata) {
				$messageid = $e->{MsgId}[0];
				print "    Message Found: $messageid\n";
				push(@messageids, "$messageid");
			}

		} else {
			print "Failed\n";
			die $response->status_line;
		}
	}

	return \@messageids;
}


sub deleteMessages {

	my $deleteMSG = shift;
	print "Deleting: $deleteMSG\n";
	$url = "https://$SERVER/vmrest/messages/$deleteMSG";
	my $ua = LWP::UserAgent->new;
	my $req = HTTP::Request->new(DELETE => $url, $header);
	$req->authorization_basic($AUTHUSER,$AUTHPASS);
	$content = $ua->request($req)->as_string;
	print Dumper "$content" if ($debug);

}
