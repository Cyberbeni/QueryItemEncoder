Pod::Spec.new do |s|

    # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
    s.name              = 'QueryItemEncoder'
    s.version           = '1.0.0'
    s.summary           = 'Converts Encodable types into [URLQueryItem]'
    s.homepage          = 'https://github.com/Cyberbeni/QueryItemEncoder'

    s.description  = <<-DESC
    Converts Encodable types into [URLQueryItem], allowing developers to switch between json and url form encoding with very little changes.
                   DESC

    # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
    s.license           = { :type => 'MIT', :file => 'LICENSE.md' }

    # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
    s.authors           = { 'Benedek Kozma' => 'cyberbeni@gmail.com' }

    # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
    #
    #  If this Pod runs only on iOS or OS X, then specify the platform and
    #  the deployment target. You can optionally include the target after the platform.
    #
    s.platform          = :ios
    s.ios.deployment_target = '10.0'

    # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
    #
    #  Specify the location from where the source should be retrieved.
    #  Supports git, hg, bzr, svn and HTTP.
    #
    s.source            = { :git => 'https://github.com/Cyberbeni/QueryItemEncoder.git', :tag => '1.0.0'}
    s.source_files = 'QueryItemEncoder/**/*.{swift}'
    s.swift_version = '4.1'

    s.static_framework = true
end
