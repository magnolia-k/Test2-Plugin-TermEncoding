use strict;
use warnings;

use Test2::Bundle::More;
use Test2::Plugin::TermEncoding;

my $hash1 = { name => "ガンダルフ" };

is_deeply($hash1, { name => "サルマン"}, "イスタルの名前");

done_testing;
