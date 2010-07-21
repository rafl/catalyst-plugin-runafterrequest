package Catalyst::Plugin::RunAfterRequest;
# ABSTRACT: run code after the response has been sent.

use Moose::Role;
use MooseX::Types::Moose qw/ArrayRef CodeRef/;

use namespace::autoclean;

has callbacks => (
    traits  => ['Array'],
    isa     => ArrayRef[CodeRef],
    default => sub { [] },
    handles => {
        run_after_request => 'push',
        _callbacks        => 'elements',
    },
);

after finalize => sub {
    my $self = shift;

    for my $callback ($self->_callbacks) {
        $self->$callback;
    }
};

=head1 SYNOPSIS

    #### In MyApp.pm
    use Catalyst qw(RunAfterRequest);

    #### In your controller
    sub my_action : Local {
        my ( $self, $c ) = @_;

        # do your normal processing...

        # add code that runs after response has been sent to client
        $c->run_after_request(    #
            sub { $self->do_something_slow(); },
            sub { $self->do_something_else_as_well(); }
        );

        # continue handling the request
    }


    #### Or in your Model:

    package MyApp::Model::Foo;

    use Moose;
    extends 'Catalyst::Model';
    with 'Catalyst::Model::Role::RunAfterRequest';

    sub some_method {
        my $self = shift;

        $self->_run_after_request(
            sub { $self->do_something_slow(); },
            sub { $self->do_something_else_as_well(); }
        );
    }


=head1 DESCRIPTION

Sometimes you want to run something after you've sent the reponse back to the
client. For example you might want to send a tweet to Twitter, or do some
logging, or something that will take a long time and would delay the response.

This module provides a conveniant way to do that by simply calling
C<run_after_request> and adding a closure to it.

=method run_after_request

    $c->run_after_request(            # '_run_after_request' in model
        sub {
            # create preview of uploaded file and store to remote server
            # etc, etc
        },
        sub {
            # another closure...
        }
    );

Takes one or more anonymous subs and adds them to a list to be run after the
response has been sent back to the client.

The method name has an underscore at the start in the model to indicate that it
is a private method. Really you should only be calling this method from within
the model and not from other code.

=cut

1;
