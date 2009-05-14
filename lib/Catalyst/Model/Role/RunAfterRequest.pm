package Catalyst::Model::Role::RunAfterRequest;

use Moose::Role;
use Catalyst::Component::InstancePerContext;

with 'Catalyst::Component::InstancePerContext';

has '_context' => ( is => 'ro', weak_ref => 1 );

sub build_per_context_instance {
    my ( $self, $c ) = @_;
    bless( { %$self, _context => $c }, ref($self) );
}

sub _run_after_request {
    my $self = shift;
    $self->_context->run_after_request(@_);
}

=head1 NAME

Catalyst::Model::Role::RunAfterRequest - run code after the response has been sent.

=head1 DESCRIPTION

See L<Catalyst::Plugin::RunAfterRequest> for full documentation.

=head1 LICENSE

This library is free software, you can redistribute it and/or modify it under
the same terms as Perl itself.

=cut

1;
