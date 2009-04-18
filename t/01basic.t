use strict;
use warnings;
use lib 't/lib';
use Test::More qw(no_plan);
use Catalyst::Test 'TestApp';

my $res = request('/foo/demonstrate');

ok($res->is_success, 'Test request is a success');

is_deeply(
  \@TestApp::Model::Foo::data,
  [ qw(one two) ],
  'Data saved ok'
);
