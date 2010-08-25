package Catalyst::Model::Role::RunAfterRequest;
# ABSTRACT: run code after the response has been sent

use Moose::Role;
use Catalyst::Component::InstancePerContext;

with 'Catalyst::Component::InstancePerContext';

has '_context' => ( is => 'ro', weak_ref => 1 );

# no-op that the 'around' can wrap. Allows the higher up model to implement
# their own 'build_per_context_instance' method.
sub build_per_context_instance { return shift; }

around build_per_context_instance => sub {
    my $orig = shift;
    my $self = shift;
    my $c    = shift;

    $self = $self->$orig( $c, @_ );

    bless( { %$self, _context => $c }, ref($self) );
};

sub _run_after_request {
    my $self = shift;
    $self->_context->run_after_request(@_);
}

=head1 DESCRIPTION

See L<Catalyst::Plugin::RunAfterRequest> for full documentation.

=begin Pod::Coverage

build_per_context_instance

=end Pod::Coverage

=cut

1;
