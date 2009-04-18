package Catalyst::Plugin::RunAfterRequest;

use strict;
use warnings;
use MRO::Compat;

our $VERSION = '1.000000';

sub run_after_request {
  my $self = shift;
  push(@{$self->{run_after_request}||=[]}, @_);
}

sub finalize {
  my $self = shift;
  $self->next::method(@_);
  $self->_run_code_after_request;
}

sub _run_code_after_request {
  my $self = shift;
  $_->($self) for @{$self->{run_after_request}||[]};
}

=head1 NAME

Catalyst::Plugin::RunAfterRequest - run things after the response has been sent

=head1 AUTHOR

Matt S Trout (mst) <mst@shadowcat.co.uk>

Edmund Von Der Burg (evdb) <email here>

=cut

1;
