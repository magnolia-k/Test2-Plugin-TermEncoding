package Test2::Plugin::TermEncoding;

use strict;
use warnings;

our $VERSION = '0.000001';

use Term::Encoding;

use Test2::API qw{
    test2_add_callback_post_load
    test2_stack
};

sub import {
    my $class = shift;

    # Should it be explicitly specified by the test script?
    require utf8;
    utf8->import;

    test2_add_callback_post_load(sub {
        my $stack = test2_stack;
        $stack->top;

        my $warned = 0;
        for my $hub ($stack->all) {
            my $format = $hub->format || next;

            unless ($format->can('encoding')) {
                warn "Could not apply encoding to unknown formatter ($format)\n" unless $warned++;
                next;
            }

            my $encoding = (-t STDOUT) ? Term::Encoding::get_encoding() : "UTF8";
            $format->encoding($encoding);
        }
    });
}

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

Test2::Plugin::TermEncoding - Test2 plugin to test with the encoding of the terminal

=head1 AUTHOR

Magnolia.k

=cut
