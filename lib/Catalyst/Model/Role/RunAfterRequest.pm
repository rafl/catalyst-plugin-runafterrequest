package Catalyst::Model::Role::RunAfterRequest;

use Moose::Role;
use Catalyst::Component::InstancePerContext;

with 'Catalyst::Component::InstancePerContext';

has '_context' => (is => 'ro', weak_ref => 1);

sub build_per_context_instance {
  my ($self, $c) = @_;
  bless({ %$self, _context => $c}, ref($self));
}

sub _run_after_request {
  my $self = shift;
  $self->_context->run_after_request(@_);
}

1;
