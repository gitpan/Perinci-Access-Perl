
use strict;
use warnings;

use 5.010001;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Access Perl module, functions, variables through Riap",
  "AUTHOR" => "Steven Haryanto <stevenharyanto\@gmail.com>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Perinci-Access-Perl",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Perinci::Access::Perl",
  "PREREQ_PM" => {
    "Class::Inspector" => 0,
    "Log::Any" => 0,
    "Module::List" => 0,
    "Perinci::Access::Base" => "0.30",
    "Perinci::Object" => "0.11",
    "Perinci::Sub::Util" => 0,
    "Perinci::Sub::Wrapper" => "0.46",
    "Progress::Any" => 0,
    "Riap" => "v1.1.19",
    "Rinci" => "v1.1.36",
    "SHARYANTO::ModuleOrPrefix::Path" => 0,
    "SHARYANTO::Package::Util" => 0,
    "Tie::Cache" => 0,
    "URI::Split" => 0,
    "UUID::Random" => 0
  },
  "TEST_REQUIRES" => {
    "File::Slurp" => 0,
    "IO::Handle" => 0,
    "IPC::Open3" => 0,
    "Perinci::Examples" => "0.08",
    "Test::Exception" => 0,
    "Test::More" => "0.98"
  },
  "VERSION" => "0.51",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  my $tr = delete $WriteMakefileArgs{TEST_REQUIRES};
  my $br = $WriteMakefileArgs{BUILD_REQUIRES};
  for my $mod ( keys %$tr ) {
    if ( exists $br->{$mod} ) {
      $br->{$mod} = $tr->{$mod} if $tr->{$mod} > $br->{$mod};
    }
    else {
      $br->{$mod} = $tr->{$mod};
    }
  }
}

unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



