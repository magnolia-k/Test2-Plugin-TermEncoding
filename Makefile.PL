use 5.006;

use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Test2-Plugin-TermEncoding',
    AUTHOR              => q{magnolia <magnolia.k@icloud.com>},
    VERSION_FROM        => 'lib/Test2/Plugin/TermEncoding.pm',
    ABSTRACT_FROM       => 'lib/Test2/Plugin/TermEncoding.pm',
    LICENSE             => 'perl',
    MIN_PERL_VERSION    => 5.008001,

    CONFIGURE_REQUIRES => {
        'ExtUtils::MakeMaker' => 6.66,
    },

    BUILD_REQUIRES => {
        'ExtUtils::MakeMaker' => 6.66,
    },

    TEST_REQUIRES => {
        'Test::More'        => 1.3,
    },

    PREREQ_PM		=> {
        'Term::Encoding'    => 0,
    },

    test => {TESTS               => 't/*.t t/*/*/*.t'},
);
