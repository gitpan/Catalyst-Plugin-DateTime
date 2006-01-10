package Catalyst::Plugin::DateTime;

use strict;
use warnings;

use Catalyst::Exception;
use DateTime;

our $VERSION = "0.02";

=pod
=head1 NAME

Catalyst::Plugin::DateTime - DateTime plugin for Catalyst.

=head1 SYNOPSIS

    # In your application class	
    use Catalyst qw/DateTime/;


    # Use DateTime objects within your Catalyst app:
    my $dt = $c->datetime(); # will return a DateTime object with local date and time
    my $dt = $c->datetime('year' => '2005', month => '01');
 
    $c->datetime->mdy(); # returns current date in mdy format (i.e. 01/01/2006)

=head1 METHODS

=over 4

=item datetime

Returns a L<DateTime> object.  If params are argued they will be passed to the 
C<< DateTime->new() >> method.  Exceptions thrown by L<DateTime> will be caught by
L<Catalyst::Exception>.

If the argument list is empty, a L<DateTime> object with the local date and time
obtained via C<< DateTime->now() >> will be returned.

=back

=cut

sub datetime {
	my $c = shift;
	my %params = @_;

	# use params if argued
	if (%params) {
		return DateTime->new(%params);
	}
	else { # otherwise use now
		return DateTime->now(time_zone => 'local');
	}
}
 
1;

=pod

=head1 DESCRIPTION

This module's intention is to make the wonders of L<DateTime> easily accesible within
a L<Catalyst> application via the L<Catalyst::Plugin> interface. 

It adds a method named C<datetime> to the C<Catalyst> namespace.

=head1 AUTHOR

James Kiser L<james.kiser@gmail.com>

=head1 SEE ALSO

L<Catalyst>, L<DateTime>

=head1 COPYRIGHT & LICNESE

    Copyright (c) 2006 the aforementioned author(s). All rights
    reserved. This program is free software; you can redistribute
    it and/or modify it under the same terms as Perl itself.

=cut


