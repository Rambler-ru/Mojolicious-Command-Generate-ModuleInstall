#!perl

use Test::More tests => 1;

BEGIN {
    use_ok( 'Mojolicious::Command::Generate::ModuleInstall' ) || print "Bail out!
";
}

diag( "Testing Mojolicious::Command::Generate::ModuleInstall $Mojolicious::Command::Generate::ModuleInstall::VERSION, Perl $], $^X" );
