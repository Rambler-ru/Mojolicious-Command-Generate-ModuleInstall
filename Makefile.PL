use inc::Module::Install;

name     'Mojolicious-Command-Generate-ModuleInstall';
all_from 'lib/Mojolicious/Command/Generate/ModuleInstall.pm';
author   q{Andrii Kostenko <andrey@kostenko.name>};
license  'perl';

build_requires 'Test::More';

auto_install;

WriteAll;

