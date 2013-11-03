
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
    "Perinci::Sub::Complete" => 0,
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
    "File::Spec" => 0,
    "IO::Handle" => 0,
    "IPC::Open3" => 0,
    "Perinci::Examples" => "0.08",
    "Test::Exception" => 0,
    "Test::More" => "0.98"
  },
  "VERSION" => "0.53",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


my %FallbackPrereqs = (
  "Class::Inspector" => 0,
  "File::Slurp" => 0,
  "File::Spec" => 0,
  "IO::Handle" => 0,
  "IPC::Open3" => 0,
  "Log::Any" => 0,
  "Module::List" => 0,
  "Perinci::Access::Base" => "0.30",
  "Perinci::Examples" => "0.08",
  "Perinci::Object" => "0.11",
  "Perinci::Sub::Complete" => 0,
  "Perinci::Sub::Util" => 0,
  "Perinci::Sub::Wrapper" => "0.46",
  "Progress::Any" => 0,
  "Riap" => "v1.1.19",
  "Rinci" => "v1.1.36",
  "SHARYANTO::ModuleOrPrefix::Path" => 0,
  "SHARYANTO::Package::Util" => 0,
  "Test::Exception" => 0,
  "Test::More" => "0.98",
  "Tie::Cache" => 0,
  "URI::Split" => 0,
  "UUID::Random" => 0
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



