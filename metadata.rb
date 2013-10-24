name             'phpenv-cookbook'
maintainer       'ThreeTreesLight'
maintainer_email 'akira@threetreeslight.com'
license          'All rights reserved'
description      'Installs and Configures phpenv-cookbook'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

recipe "phpenv", "Installs and configures phpenv"

%w{ centos redhat }.each do |os|
  supports os
end

%w{ git build-essential apt yum }.each do |cb|
  depends cb
end

depends 'ohai', '>= 1.1'
