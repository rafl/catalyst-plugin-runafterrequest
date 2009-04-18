package TestApp::Controller::Foo;

use base qw(Catalyst::Controller);
use Moose;

sub demonstrate :Local {
  my ($self, $c) = @_;
  $c->res->body('YAY');
  $c->model('Foo')->demonstrate;
}

1;
