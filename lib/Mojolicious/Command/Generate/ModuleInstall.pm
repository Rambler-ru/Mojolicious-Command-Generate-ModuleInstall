package Mojolicious::Command::Generate::ModuleInstall 0.01;

use strict;
use warnings;

use 5.12.0;
use base 'Mojo::Command';

__PACKAGE__->attr(description => <<'EOF');
Generate Makefile.PL using Module::Install.
EOF
__PACKAGE__->attr(usage => <<"EOF");
usage: $0 generate makefile
EOF

# If we don't go back there and make that event happen,
# the entire universe will be destroyed...
# And as an environmentalist, I'm against that.
sub run {
    my $self = shift;

    my $class = $ENV{MOJO_APP} || 'MyApp';
    my $path  = $self->class_to_path($class);
    my $name  = $self->class_to_file($class);

    $self->render_to_rel_file('makefile', 'Makefile.PL', $class, $path,
        $name);
    $self->chmod_file('Makefile.PL', 0744);
}

1;
__DATA__
@@ makefile
% my ($class, $path, $name) = @_;
#!/usr/bin/env perl

use 5.008007;

use strict;
use warnings;

# Son, when you participate in sporting events,
# it's not whether you win or lose, it's how drunk you get.
use inc::Module::Install;

name '<%= $class %>';
all_from 'lib/<%= $path %>';
install_script 'script/<%= $name %>';
requires 'Mojolicious' => '1.0';
WriteAll;
__END__
=head1 NAME

Mojolicious::Command::Generate::ModuleInstall - Module::Install Makefile Generator Command

=head1 SYNOPSIS

    use Mojolicious::Command::Generate::ModuleInstall;

    my $makefile = Mojolicious::Command::Generate::ModuleInstall->new;
    $makefile->run(@ARGV);

=head1 DESCRIPTION

L<Mojolicious::Command::Generate::ModuleInstall> is a makefile generator.

=head1 ATTRIBUTES

L<Mojolicious::Command::Generate::ModuleInstall> inherits all attributes from
L<Mojo::Command> and implements the following new ones.

=head2 C<description>

    my $description = $makefile->description;
    $makefile       = $makefile->description('Foo!');

Short description of this command, used for the command list.

=head2 C<usage>

    my $usage = $makefile->usage;
    $makefile = $makefile->usage('Foo!');

Usage information for this command, used for the help screen.

=head1 METHODS

L<Mojolicious::Command::Generate::Makefile> inherits all methods from
L<Mojo::Command> and implements the following new ones.

=head2 C<run>

    $makefile = $makefile->run(@ARGV);

Run this command.

=head1 SEE ALSO

L<Mojolicious>, L<Mojolicious::Guides>, L<http://mojolicio.us>.

=cut
