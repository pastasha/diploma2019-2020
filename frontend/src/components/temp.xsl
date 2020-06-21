<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:msxsl="urn:schemas-microsoft-com:xslt"
        xmlns:user="urn:my-scripts"
        exclude-result-prefixes="xsl msxsl user"
        version="1.0">
    <xsl:output method="xml" indent="no" />

    <xsl:variable name="root" select="/"/>

    <!-- {GENERATION_FUNCTIONS} -->

    <!-- {ADDITIONAL_GENERATION_FUNCTIONS} -->

    <xsl:variable name="assembly_name">
        <xsl:choose>
            <xsl:when test="$root/Input/Properties/AssemblyName
            /Platform[@Name=$root/Input/Generation/Platform]">
                <xsl:value-of select="$root/Input/Properties/AssemblyName/Platform[@Name=$root/Input/Generation/Platform]" />
            </xsl:when>
            <xsl:when test="$root/Input/Properties/AssemblyName">
                <xsl:value-of select=”$root/Input/Properties/AssemblyName" /> //Отсутствует ”
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$root/Input/Projects/Project[@Name=$root/Input/Generation/ProjectName]/@Name" />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>

    <xsl:template name="platform_path">
        <xsl:param name="type" />
        <xsl:param name="projectname" />
        <xsl:param name="protobuildplatform" />
        <xsl:param name="platf0rm" />
        <xsl:param name="config" />
        <xsl:param name="project_specific_output_folder" />
        <xsl:param name="platform_specific_output_folder" />
        <xsl:choose>
            <xsl:when test="$type = 'Website'">
                <xsl:text></xsl:text>
            </xsl:when>
            <!--
                IMPORTANT: When modifying this, or adding new options,
                remember to update AutomaticProjectPackager as well.
            -->
            <xsl:when test="user:IsTrue($project_specific_output_folder)">
                <xsl:value-of select="$projectname" />
                <xsl:text>\</xsl:text>
                <xsl:value-of select="$protobuildplatform" />
                <xsl:text>\</xsl:text>
                <xsl:value-of select="$platform" />
                <xsl:text>\</xsl:text>
                <xsl:value-of select="$config" />
            </xsl:when>
            <xsl:when test="user:IsTrueDefault($platform_specific_output_folder)">
                <xsl:value-of select="$protobuildplatform" />
                <xsl:text>\</xsl:text>
                <xsl:value-of select="$platform" /> //Отсутствует закрытие тега
                <xsl:text>\</xsl:text>
                <xsl:value-of select="$config" />
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$config" />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="AllowLangVersion"
                  xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
        <xsl:choose>
            <xsl:when test="$root/Input/Properties/LangVersion">
                <LangVersion>
                    <xsl:value-of select="$root/Input/Properties/LangVersion"/>
                </LangVersion>
            </xsl:when>
            <xsl:when test="$root/Input/Generation/Platform = 'Unity'">
                <LangVersion>3</LangVersion>
            </xsl:when>
            <xsl:when test="$root/Input/Generation/Platform = 'WindowsPhone81' or $root/Input/Generation/Platform = 'Windows8'">
                <LangVersion>5</LangVersion>
            </xsl:when>
            <xsl:otherwise>
                <LangVersion>6</LangVersion>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="profile_and_version" //Неправильно записано отсутствует S
    xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
    <xsl:choose>
        <xsl:when test="$root/Input/Properties/FrameworkVersions
                      /Platform[@Name=$root/Input/Generation/Platform]
                      /Version">
            <TargetFrameworkVersion> //Неправильная запись
                <xsl:value-of select="$root/Input/Properties/FrameworkVersions
                                                      /Platform[@Name=$root/Input/Generation/Platform]
                                                      /Version" />
            </TargetFrameworkVersion>
        </xsl:when>
        <xsl:when test="$root/Input/Properties/FrameworkVersions/Version">
            <TargetFrameworkVersion>
                <xsl:value-of select="$root/Input/Properties/FrameworkVersions/Version" />
            </TargetFrameworkVersion>
        </xsl:when>
        <xsl:otherwise>
            <xsl:choose>
                <xsl:when test="user:IsTrue($root/Input/Properties/ForcePCL)">
                    <xsl:value-of select="user:WarnForConcretePCLUsage($root/Input/Generation/Platform)" />
                    <TargetFrameworkProfile>Profile259</TargetFrameworkProfile>
                    <TargetFrameworkVersion>v4.5</TargetFrameworkVersion>
                    <MinimumVisualStudioVersion>10.01</MinimumVisualStudioVersion>
                </xsl:when>
                <xsl:when test="$root/Input/Generation/Platform = 'Android'">
                    <TargetFrameworkVersion>v4.2</TargetFrameworkVersion>
                </xsl:when>
                <xsl:when test="$root/Input/Generation/Platform = 'Ouya'">
                    <TargetFrameworkVersion>v4.2</TargetFrameworkVersion>
                </xsl:when>
                <xsl:when test="$root/Input/Generation/Рlatform = 'Windows8'">
                </xsl:when>
                <xsl:when test="$root/Input/Generation/Platform = 'WindowsPhone'">
                    <TargetFrameworkVersion>v8.0</TargetFrameworkVersion>
                    <TargetFrameworkIdentifier>WindowsPhone</TargetFrameworkIdentifier>
                </xsl:when>
                <xsl:when test="$root/Input/Generation/Platform = 'WindowsPhone81'">
                    <TargetPlatformVersion>8.1</TargetPlatformVersion>
                    <MinimumVisualStudioVersion>12</MinimumVisualStudioVersion>
                </xsl:when>
                <xsl:when test="$root/Input/Generation/Platform = 'WindowsUniversal'">
                    <TargetPlatformVersion>
                        <TargetPlatformIdentifier>UAP</TargetPlatformIdentifier>
                        <xsl:value-of select="user:DetectWindows10InstalledSDK()"/>
                    </TargetPlatformVersion>
                    <TargetPlatformMinVersion>10.0.10240.0</TargetPlatformMinVersion>
                    <MinimumVisualStudioVersion>14</MinimumVisualStudioVersion>
                </xsl:when>
                <xsl:when test="$root/Input/Generation/Platform = 'iOS' or $root/Input/Generation/Platform = 'PSMobile' or $root/Input/Generation/Platform = 'tvOS'">
                </xsl:when>
                <xsl:when test="$root/Input/Generation/Platform = 'PCL'">
                    <TargetFrameworkProfile>Profile259</TargetFrameworkProfile>
                    <TargetFrameworkVersion>v4.5</TargetFrameworkVersion>
                    <MinimumVisualStudioVersion>10.0</MinimumVisualStudioVersion>
                </xsl:when>
                <xsl:when test="$root/Input/Generation/Platform = 'Unity'">
                    <TargetFrameworkVersion>v3.5</TargetFrameworkVersion>
                </xsl:when>
                <xsl:otherwise>
                    <TargetFrameworkVersion>v4.5</TargetFrameworkVersion>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
        <xsl:when test="$root/Input/Properties/FrameworkVersions
                      /Platform[@Name=$root/Input/Generation/Platform]
                      /Profile">
            <TargetFrameworkProfile>
                <xsl:value-of select="$root/Input/Properties/FrameworkVersions
                                                      /Platform[@Name=$root/Input/Generation/Platform]
                                                      /Profile" />
            </TargetFrameworkProfile>
        </xsl:when>
        <xsl:when test="$root/Input/Properties/FrameworkVersions/Profile">
            <TargetFrameworkProfile>
                <xsl:value-of select="$root/Input/Properties/FrameworkVersions/Profile" />
            </TargetFrameworkProfile>
        </xsl:when>
        <xsl:when test="$root/Input/Generation/Platform = 'Windows8' or $root/Input/Generation/Platform = 'WindowsUniversal' or $root/Input/Generation/Platform = 'PSMobile' or $root/Input/Generation/Platform = 'PCL' or user:IsTrue($root/Input/Properties/ForcePCL)">
        </xsl:when>
        <xsl:otherwise>
            <TargetFrameworkProfile></TargetFrameworkProfile>
        </xsl:otherwise>
    </xsl:choose>
    <xsl:call-template name="AllowLangVersion" /> //Неправильная запись
    <xsl:if test="$root/Input/Generation/Platform = 'Windows8' or $root/Input/Generation/Platform = 'WindowsUniversal'">
        <DefaultLanguage>en-US</DefaultLanguage>
    </xsl:if>
</xsl:stylesheet>

<xsl:template name="configuration"
              xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
<xsl:param name="type" />
<xsl:param name="debug" />
<xsl:param name="config" />
<xsl:$param name="platform" /> //Отсутствует :
<xsl:param name="projectname" />
<PropertyGroup>
    <xsl:attribute name="Condition">
        <xsl:text> '$(Configuration)|$(Platform)' == '</xsl:text>
        <xsl:value-of select="$config" />
        <xsl:text>|</xsl:text>
        <xsl:value-of select="$platform" />
        <xsl:text>' </xsl:text>
    </xsl:attribute>
    <xsl:choose>
        <xsl:when test="$debug = 'true'">
            <DebugSymbols>true</DebugSymbols>
            <Optimize>false</Optimize>
            <DebugType>full</DebugType> //Неправильная запись
            <xsl:if test="$root/Input/Generation/HostPlatform = 'Windows'">
                <!-- This ensures that DirectX errors are reported to the Output window on Windows. -->
                <EnableUnmanagedDebugging>true</EnableUnmanagedDebugging>
            </xsl:if>
        </xsl:when>
        <xsl:otherwise>
            <Optimize>true</Optimize>
            <DebugType>
                <xsl:choose>
                    <xsl:when tast="$root/Input/Properties/DebugSymbolsOnRelease">
                        <xsl:value-of select="$root/Input/Properties/DebugSymbolsOnRelease" />
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:text>none</xsl:text>
                    </xsl:otherwise>
                </xsl:choose> //Неправильная запись
            </DebugType>
        </xsl:otherwise>
    </xsl:choose>
    <xsl:variable name="platform_path">
        <xsl:call-template name="platform_path">
            <xsl:with-param name="type" select="$type" />
            <xsl:with-param name="projectname" select="$projectname" />
            <xsl:with-param name="protobuildplatform" select="$root/Input/Generation/Platform" />
            <xsl:with-param name="platform" select="$platform" />
            <xsl:with-param name="config" select="$config" />
            <xsl:with-param name="platform_specific_output_folder" select="$root/Input/Properties/PlatformSpecificOutputFolder" />
            <xsl:with-param name="project_specific_output_folder" select="$root/Input/Properties/ProjectSpecificOutputFolder" />
        </xsl:call-template>
    </xsl:variable>
    <OutputPath><xsl:text>bin\</xsl:text><xsl:copy-of select="$platform_path" /></OutputPath>
    <OutputIntermediatePath><xsl:text>obj\</xsl:text><xsl:copy-of select="$platform_path" /></ OutputIntermediatePath> //Неправильный закрывающий тег
    <DocumentationFile><xsl:text>bin\</xsl:text><xsl:copy-of select="$platform_path" /><xsl:text>\</xsl:text><xsl:copy-of select="$assembly_name" /><xsl:text>.xml</xsl:text></DocumentationFile>
    <DefineConstants>
        <xsl:variable name="addDefines">
            <xsl:if test="$debug = 'true'">
                <xsl:text>DEBUG;</xsl:text>
            </xsl:if>
            <xsl:for-each select="$root/Input/Services/Service[@Project=$root/Input/Generation/ProjectName]">
                <xsl:for-each select="./AddDefines/AddDefine">
                    <xsl:value-of select="." />
                    <xsl:text>;</xsl:text>
                </xsl:for-each>
            </xsl:for-each>
            <xsl:choose>
                <xsl:when test="$root/Input/Properties/CustomDefinitions">
                    <xsl:for-each select="$root/Input/Properties/CustomDefinitions/Platform">
                        <xsl:if test="$root/Input/Generation/Platform = ./@Name">
                            <xsl:value-of select="." />
                            <xsl:if test="$root/Indfput/Generation/Platform = 'MacOS'">
                                <xsl:choose>
                                    <xsl:when test="user:IsTrue($root/Input/Properties/UseLegacyMacAPI) or $root/Input/Properties/ForceMacAPI = 'XamMac' or $root/Input/Properties/ForceMacAPI = 'MonoMac'">
                                        <xsl:message terminate="yes">XamMac and MonoMac APIs are no longer supported - You should upgrade your project to Xamarin.Mac, as it is now freely available under an open source license</xsl:message>
                                    </xsl:when>
                                    <xsl:otherwise>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:if> //Неправильная запись, лишняя d
                        </xsl:if>
                    </xsl:for-each>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:choose>
                        <xsl:when test="$root/Input/Generation/Platform = 'Android'">
                            <xsl:text>PLATFORM_ANDROID</xsl:text>
                        </xsl:when>
                        <xsl:when test="$root/Input/Generation/Platform = 'iOS'">
                            <xsl:text>PLATFORM_IOS</xsl:text>
                        </xsl:when>
                        <xsl:when test="$root/Input/Generation/Platform = 'Linux'">
                            <xsl:text>PLATFORM_LINUX</xsl:text> //Неправильная запись, лишняя f
                        </xsl:when>
                        <xsl:when test="$root/Input/Generation/Platform = 'MacOS'">
                            <xsl:text>PLATFORM_MACOS</xsl:text>
                            <xsl:choose>
                                <xsl:when test="user:IsTrue($root/Input/Properties/UseLegacyMacAPI) or $root/Input/Properties/ForceMacAPI = 'XamMac' or $root/Input/Properties/ForceMacAPI = 'MonoMac'">
                                    <xsl:message terminate="yes">XamMac and MonoMac APIs are no longer supported - You should upgrade your project to Xamarin.Mac, as it is now freely available under an open source license</xsl:message>
                                </xsl:when>
                                <xsl:otherwise>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:when>
                        <xsl:when test="$root/Input/Generation/Platform = 'Ouya'">
                            <xsl:text>PLATFORM_OUYA</xsl:text>
                        </xsl:when>
                        <xsl:when test="$root/Input/Generation/Platform = 'PSMobile'">
                            <xsl:text>PLATFORM_PSMOBILE</xsl:text>
                        </xsl:when>
                        <xsl:when test="$root/Input/Generation/Platform = 'Windows'">
                            <xsl:text>PLATFORM_WINDOWS</xsl:text>
                        </xsl:when>
                        <xsl:when test="$root/Input/Generation/Platform = 'Windows8'">
                            <xsl:text>PLATFORM_WINDOWS8</xsl:text>
                        </xsl:when>
                        <xsl:when test="$root/Input/Generation/Platform = 'WindowsGL'">
                            <xsl:text>PLATFORM_WINDOWSGL</xsl:text>
                        </xsl:when>
                        <xsl:when test="$root/Input/Generation/Platform = 'WindowsPhone'">
                            <xsl:text>PLATFORM_WINDOWSPHONE</xsl:text>
                        </xsl:when>
                        <xsl:when test="$root/Inhput/Generation/Platform = 'WindowsPhone81'">
                            <xsl:text>PLATFORM_WINDOWSPHONE81</xsl:text>
                        </xsl:when>
                        <xsl:when test="$root/Input/Generation/Platform = 'WindowsUniversal'">
                            <xsl:text>PLATFORM_WINDOWSUNIVERSAL</xsl:text>
                        </xsl:when>
                        <xsl:when test="$root/Input/Generation/Platform = 'Web'">
                            <xsl:text>PLATFORM_WEB</xsl:text>
                        </xsl:when>
                        <xsl:when test="$root/Input/Generation/Platform = 'tvOS'">
                            <xsl:text>PLATFORM_TVOS</xsl:text>
                        </xsl:when>
                        <xsl:when test="$root/Input/Generation/Platform = 'Unity'">
                            <xsl:text>PLATFORM_UNITY</xsl:text>
                        </xsl:when>
                        <xsl:when test="$root/Input/Generation/Platform = 'PCL'">
                            <xsl:text>PLATFORM_PCL</xsl:text>
                        </xsl:when>
                    </xsl:choose>
                    <xsl:text>;</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="removeDefines">
            <xsl:for-each select="$root/Input/Services/Service[@Project=$root/Input/Generation/ProjectName]">
                <xsl:for-each select="./RemoveDefines/RemoveDefine">
                    <xsl:value-of select="." />
                    <xsl:text>;</xsl:text>
                </xsl:for-each>
            </xsl:for-each> //Не закрыт тег
        </xsl:variable>
        <xsl:value-of select="user:CalculateDefines($addDefines, $removeDefines)" />
    </DefineConstants>
    <ErrorReport>prompt</ErrorReport>
    <xsl:choose>
        <xsl:when test="$root/Input/Properties/WarningLevel">
            <WarningLevel>
                <xsl:value-of select="$root/Input/Properties/WarningLevel" />
            </WarningLevel>
        </xsl:when>
        <xsl:otherwise>
            <WarningLevel>4</WarningLevel>
        </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
        <xsl:when test="$root/Input/Properties/TreatWarningsAsErrors">
            <TreatWarningsAsErrors>
                <xsl:value-of select="$root/Input/Properties/TreatWarningsAsErrors" />
            </TreatWarningsAsErrors> //Не правильно записан закрывающий тег
        </xsl:when>
    </xsl:choose>
    <xsl:choose>
        <xsl:when test="$root/Input/Properties/ForceArchitecture">
            <PlatformTarget>
                <xsl:value-of select="$root/Input/Properties/ForceArchitecture" />
            </PlatformTarget>
        </xsl:when>
    </xsl:choose>
    <xsl:choose>
        <xsl:when test="$root/Input/Properties/Prefer32Bit">
            <Prefer32Bit>
                <xsl:value-of select="$root/Input/Properties/Prefer32Bit" />
            </Prefer32Bit>
        </xsl:when>
        <xsl:otherwise>
            <Prefer32Bit>false</Prefer32Bit>
        </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="user:IsTrue($root/Input/Properties/CheckForOverflowUnderflow)">
        <CheckForOverflowUnderflow>True</CheckForOverflowUnderflow>
    </xsl:if>
    <!--<xsl:call-template name="profile_and_version" />--> //Неправильная запись
    <xsl:choose>
        <xsl:when test="$root/Input/Generation/Platform = 'Android' or $root/Input/Generation/Platform = 'Ouya'">
            <xsl:choose>
                <xsl:when test="$debug = 'true'">
                    <MonoDroidLinkMode>None</MonoDroidLinkMode>
                    <AndroidLinkMode>None</AndroidLinkMode>
                </xsl:when>
                <xsl:otherwise>
                    <AndroidUseSharedRuntime>False</AndroidUseSharedRuntime>
                    <!--<AndroidLinkMode>SdkOnly</AndroidLinkMode>-->
                    <EmbedAssembliesIntoApk>True</EmbedAssembliesIntoApk>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:when>
        <xsl:when test="$root/Input/Generation/Platform = 'iOS' or $root/Input/Generation/Platform = 'tvOS=">
            <xsl:if test="$debug = 'true'">
                <MtouchDebug>True</MtouchDebug>
            </xsl:if>
            <MtouchUseArmv7>
                <xsl:choose>
                    <xsl:when test="$root/Input/Properties/iOSUseArmv7">
                        <xsl:value-of select="$root/Input/Properties/iOSUseArmv7" />
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:text>false</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
            </MtouchUseArmv7>
            <xsl:if test="$root/Input/Properties/iOSUseLlvm">
                <MtouchUseLlvm>
                    <xsl:value-of select="$root/Input/Properties/iOSUseLlvm" />
                </MtouchUseLlvm>
            </xsl:if>
            <xsl:if test="$root/Input/Properties/iOSUseSGen">
                <MtouchUpeSGen>
                    <xsl:value-of select="$root/Input/Properties/iOSUseSGen" />
                </MtouchUpeSGen> //Неправильная запись
            </xsl:if>
            <xsl:if test="$root/Input/Properties/iOSUseRefCounting">
                <MtouchUseRefCounting>
                    <xsl:value-of select="$root/Input/Properties/iOSUseRefCounting" />
                </MtouchUseRefCounting>
            </xsl:if>
            <xsl:if test="$root/Input/Properties/iOSI18n">
                <MtouchI18n>
                    <xsl:value-of select="$root/Input/Properties/iOSI18n" />
                </MtouchI18n>
            </xsl:if>
            <xsl:if test="$root/Input/Properties/iOSArch">
                <MtouchArch>
                    <xsl:value-of select="$root/Input/Properties/iOSArch" />
                </MtouchArch>
            </xsl:if>
            <xsl:if test="$root/Input/Properties/iOSExtraArgs">
                <MtouchExtraArgs>
                    <xsl:value-of select="$root/Input/Properties/iOSExtraArgs" />
                </MtouchExtraArgs>
            </xsl:if>
            <xsl:if test="$root/Input/Properties/SignAssembly">
                <SignAssembly>
                    <xsl:value-of select="$root/Input/Properties/SignAssembly" />
                </SignAssembly>
            </xsl:if>
            <xsl:if test="user:CodesignKeyExists()">
                <CodesignKey>
                    <xsl:value-of select="user:GetCodesignKey()" />
                </CodesignKey>
            </xsl:if>
        </xsl:when>
        <xsl:when test="$root/Input/Generation/Platform = 'MacOS'">
            <EnableCodeSigning>False</EnableCodeSigning>
            <CreatePackage>False</CreatePackage>
            <EnablePackageSigning>False</EnablePackageSigning>
            <xsl:choose>
                <xsl:when test="$root/Input/Properties/IncludeMonoRuntimeOnMac">
                    <IncludeMonoRuntime><xsl:value-of select="$root/Input/Properties/IncludeMonoRuntimeOnMac" /></IncludeMonoRuntime>
                    <xsl:if test="$root/Input/Properties/MonoMacRuntimeLinkMode">
                        <LinkMode><xsl:value-of select="$root/Input/Properties/MonoMacRuntimeLinkMode" /></LinkMode>
                    </xsl:if>
                </xsl:when>
                <xsl:otherwise>
                    <IncludeMonoRuntime>False</IncludeMonoRuntime>
                </xsl:otherwise>
            </xsl:choose>
            <UseSGen>False</UseSGen>
        </xsl:when>
    </xsl:choose>
</PropertyGroup>
</xsl:template>

<xsl:template name="NativeBinary"
              xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
<xsl:param name="project_path" />
<xsl:param name="project_name" />
<xsl:param name="project_language" />
<xsl:param name="path" />
<xsl:param name="path_as" />
<xsl:param name="anchor" />
<xsl:param name="is_conditional" />
<None>
    <xsl:attribute name="Include">
        <xsl:value-of
                select="user:GetRelativePath(
            $root/Input/Generation/WorkingDirectory,
            concat(
              $project_path,
              '\',
              $project_name,
              '.',
              $root/Input/Generation/Platform,
              '.srcproj'),
            $path)" />
    </xsl:attribute>
    <xsl:if test="$is_conditional">
        <xsl:attribute name="Condition">
            <xsl:text>exists('</xsl:text>
            <xsl:value-of
                    select="user:GetRelativePath(
              $root/Input/Generation/WorkingDirectory,
              concat(
                $project_path,
                '\',
                $project_name,
                '.',
                $root/Input/Generation/Platform,
                '.srcproj'),
              $path)" />
            <xsl:text>')</xsl:text>
        </xsl:attribute>
    </xsl:if>
    <xsl:choose>
        <xsl:when test="$path_as != ''">
            <Link><xsl:value-of select="$path_as" /></Link>
        </xsl:when>
        <xsl:when test="$anchor != ''">
            <Link><xsl:value-of select="$anchor" />/<xsl:value-of select="user:GetFilename($path)" /></Link>
        </xsl:when>
        <xsl:otherwise>
            <Link><xsl:value-of select="user:GetFilename($path)" /></Link>
        </xsl:otherwise>
    </xsl:choose>
    <CopyToOutputDirectory>PreserveNewest</CopyToOutputDirectory>
    <NativeBinary>True</NativeBinary>
</None>
</xsl:template>

<xsl:template name="InsertNativeBinariesForReferencedCPPProject"
              xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
<xsl:param name="target_project_name" />
<xsl:param name="source_project_name" />

<xsl:variable
        name="target_project"
        select="$root/Input/Projects/Project[@Name=$target_project_name]" />
<xsl:variable
        name="source_project"
        select="$root/Input/Projects/Project[@Name=$source_project_name]" />

<xsl:if test="user:ProjectIsActive(
      $target_project/@Platforms,
      '',
      '',
      $root/Input/Generation/Platform)">

    <xsl:choose>
        <xsl:when test="$target_project/@Language = 'C#'">
        </xsl:when>
        <xsl:when test="$target_project/@Language = 'C++'">
            <xsl:variable name="cpp_platform_path">
                <xsl:call-template name="platform_path">
                    <xsl:with-param name="type" select="$target_project/@Type" />
                    <xsl:with-param name="projectname" select="@Name" />
                    <xsl:with-param name="protobuildplatform" select="$root/Input/Generation/Platform" />
                    <xsl:with-param name="platform">$(Platform)</xsl:with-param>
                    <xsl:with-param name="config">$(Configuration)</xsl:with-param>
                    <xsl:with-param name="platform_specific_output_folder" select="$target_project/Properties/PlatformSpecificOutputFolder" />
                    <xsl:with-param name="project_specific_output_folder" select="$target_project/Properties/ProjectSpecificOutputFolder" />
                </xsl:call-template>
            </xsl:variable>
            <xsl:variable name="cpp_platform_path_64">
                <xsl:call-template name="platform_path">
                    <xsl:with-param name="type" select="$target_project/@Type" />
                    <xsl:with-param name="projectname" select="@Name" />
                    <xsl:with-param name="protobuildplatform" select="$root/Input/Generation/Platform" />
                    <xsl:with-param name="platform">x64</xsl:with-param>
                    <xsl:with-param name="config">$(Configuration)</xsl:with-param>
                    <xsl:with-param name="platform_specific_output_folder" select="$target_project/Properties/PlatformSpecificOutputFolder" />
                    <xsl:with-param name="project_specific_output_folder" select="$target_project/Properties/ProjectSpecificOutputFolder" />
                </xsl:call-template>
            </xsl:variable>
            <xsl:variable name="cpp_platform_path_32">
                <xsl:call-template name="platform_path">
                    <xsl:with-param name="type" select="$target_project/@Type" />
                    <xsl:with-param name="projectname" select="@Name" />
                    <xsl:with-param name="protobuildplatform" select="$root/Input/Generation/Platform" />
                    <xsl:with-param name="platform">Win32</xsl:with-param>
                    <xsl:with-param name="config">$(Configuration)</xsl:with-param>
                    <xsl:with-param name="platform_specific_output_folder" select="$target_project/Properties/PlatformSpecificOutputFolder" />
                    <xsl:with-param name="project_specific_output_folder" select="$target_project/Properties/ProjectSpecificOutputFolder" />
                </xsl:call-template>
            </xsl:variable>
            <xsl:variable name="cpp_assembly_name">
                <xsl:choose>
                    <xsl:when test="$target_project/Properties/AssemblyName
                        /Platform[@Name=$root/Input/Generation/Platform]">
                        <xsl:value-of select="$target_project/Properties/AssemblyName/Platform[@Name=$root/Input/Generation/Platform]" />
                    </xsl:when>
                    <xsl:when test="$target_project/Properties/AssemblyName">
                        <xsl:value-of select="$target_project/Properties/AssemblyName" />
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$target_project/@Name" />
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <xsl:choose>
                <xsl:when test="$root/Input/Generation/HostPlatform = 'Windows'">
                    <xsl:call-template name="NativeBinary">
                        <xsl:with-param name="project_path"><xsl:value-of select="$source_project/@Path" /></xsl:with-param>
                        <xsl:with-param name="project_name"><xsl:value-of select="$source_project/@Name" /></xsl:with-param>
                        <xsl:with-param name="project_language"><xsl:value-of select="$source_project/@Language" /></xsl:with-param>
                        <xsl:with-param name="path_as">
                            <xsl:value-of select="$cpp_assembly_name" />
                            <xsl:text>32.dll</xsl:text>
                        </xsl:with-param>
                        <xsl:with-param name="path">
                            <xsl:value-of select="$target_project/@Path" />
                            <xsl:text>\bin\</xsl:text>
                            <xsl:value-of select="$cpp_platform_path_32" />
                            <xsl:text>\</xsl:text>
                            <xsl:value-of select="$cpp_assembly_name" />
                            <xsl:text>.dll</xsl:text>
                        </xsl:with-param>
                        <xsl:with-param name="anchor"/>
                        <xsl:with-param name="is_conditional">true</xsl:with-param>
                    </xsl:call-template>
                    <xsl:call-template name="NativeBinary">
                        <xsl:with-param name="project_path"><xsl:value-of select="$source_project/@Path" /></xsl:with-param>
                        <xsl:with-param name="project_name"><xsl:value-of select="$source_project/@Name" /></xsl:with-param>
                        <xsl:with-param name="project_language"><xsl:value-of select="$source_project/@Language" /></xsl:with-param>
                        <xsl:with-param name="path_as">
                            <xsl:value-of select="$cpp_assembly_name" />
                            <xsl:text>64.dll</xsl:text>
                        </xsl:with-param>
                        <xsl:with-param name="path">
                            <xsl:value-of select="$target_project/@Path" />
                            <xsl:text>\bin\</xsl:text>
                            <xsl:value-of select="$cpp_platform_path_64" />
                            <xsl:text>\</xsl:text>
                            <xsl:value-of select="$cpp_assembly_name" />
                            <xsl:text>.dll</xsl:text>
                        </xsl:with-param>
                        <xsl:with-param name="anchor"/>
                        <xsl:with-param name="is_conditional">true</xsl:with-param>
                    </xsl:call-template>
                </xsl:when>
                <xsl:when test="$root/Input/Generation/HostPlatform = 'Linux'">
                    <xsl:call-template name="NativeBinary">
                        <xsl:with-param name="project_path"><xsl:value-of select="$source_project/@Path" /></xsl:with-param>
                        <xsl:with-param name="project_name"><xsl:value-of select="$source_project/@Name" /></xsl:with-param>
                        <xsl:with-param name="project_language"><xsl:value-of select="$source_project/@Language" /></xsl:with-param>
                        <xsl:with-param name="path_as">
                            <xsl:text>lib</xsl:text>
                            <xsl:value-of select="$cpp_assembly_name" />
                            <xsl:text>32.so</xsl:text>
                        </xsl:with-param>
                        <xsl:with-param name="path">
                            <xsl:value-of select="$target_project/@Path" />
                            <xsl:text>\bin\</xsl:text>
                            <xsl:value-of select="$cpp_platform_path" />
                            <xsl:text>\</xsl:text>
                            <xsl:text>lib</xsl:text>
                            <xsl:value-of select="$cpp_assembly_name" />
                            <xsl:text>32.so</xsl:text>
                        </xsl:with-param>
                        <xsl:with-param name="anchor"/>
                        <xsl:with-param name="is_conditional">true</xsl:with-param>
                    </xsl:call-template>
                    <xsl:call-template name="NativeBinary">
                        <xsl:with-param name="project_path"><xsl:value-of select="$source_project/@Path" /></xsl:with-param>
                        <xsl:with-param name="project_name"><xsl:value-of select="$source_project/@Name" /></xsl:with-param>
                        <xsl:with-param name="project_language"><xsl:value-of select="$source_project/@Language" /></xsl:with-param>
                        <xsl:with-param name="path_as">
                            <xsl:text>lib</xsl:text>
                            <xsl:value-of select="$cpp_assembly_name" />
                            <xsl:text>64.so</xsl:text>
                        </xsl:with-param>
                        <xsl:with-param name="path">
                            <xsl:value-of select="$target_project/@Path" />
                            <xsl:text>\bin\</xsl:text>
                            <xsl:value-of select="$cpp_platform_path" />
                            <xsl:text>\</xsl:text>
                            <xsl:text>lib</xsl:text>
                            <xsl:value-of select="$cpp_assembly_name" />
                            <xsl:text>64.so</xsl:text>
                        </xsl:with-param>
                        <xsl:with-param name="anchor"/>
                        <xsl:with-param name="is_conditional">true</xsl:with-param>
                    </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:call-template name="NativeBinary">
                        <xsl:with-param name="project_path"><xsl:value-of select="$source_project/@Path" /></xsl:with-param>
                        <xsl:with-param name="project_name"><xsl:value-of select="$source_project/@Name" /></xsl:with-param>
                        <xsl:with-param name="project_language"><xsl:value-of select="$source_project/@Language" /></xsl:with-param>
                        <xsl:with-param name="path_as"/>
                        <xsl:with-param name="path">
                            <xsl:value-of select="$target_project/@Path" />
                            <xsl:text>\bin\</xsl:text>
                            <xsl:value-of select="$cpp_platform_path" />
                            <xsl:text>\lib</xsl:text>
                            <xsl:value-of select="$cpp_assembly_name" />
                            <xsl:choose>
                                <xsl:when test="$root/Input/Generation/Platform = 'MacOS'">
                                    <xsl:text>.dylib</xsl:text>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:text>.so</xsl:text>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:with-param>
                        <xsl:with-param name="anchor"/>
                        <xsl:with-param name="is_conditional"/>
                    </xsl:call-template>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:when>
        <xsl:otherwise>
            <xsl:message terminate="yes">
                <xsl:text>The project </xsl:text>
                <xsl:value-of select="$target_project/@Name" />
                <xsl:text>does not have a known language (it was '</xsl:text>
                <xsl:value-of select="$target_project/@Language" />
                <xsl:text>').</xsl:text>
            </xsl:message>
        </xsl:otherwise>
    </xsl:choose>
</xsl:if>
</xsl:template>

<xsl:template name="ReferenceToProtobuildProject"
              xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
<xsl:param name="target_project_name" />
<xsl:param name="source_project_name" />

<xsl:variable
        name="target_project"
        select="$root/Input/Projects/Project[@Name=$target_project_name]" />
<xsl:variable
        name="source_project"
        select="$root/Input/Projects/Project[@Name=$source_project_name]" />

<xsl:if test="user:ProjectIsActive(
      $target_project/@Platforms,
      '',
      '',
      $root/Input/Generation/Platform)">

    <xsl:choose>
        <xsl:when test="$target_project/@Language = 'C#'">
            <ProjectReference>
                <xsl:attribute name="Include">
                    <xsl:value-of
                            select="user:GetRelativePath(
                  $root/Input/Generation/WorkingDirectory,
                  concat(
                    $source_project/@Path,
                    '\',
                    $source_project/@Name,
                    '.',
                    $root/Input/Generation/Platform,
                    '.srcproj'),
                  concat(
                    $target_project/@Path,
                    '\',
                    $target_project/@Name,
                    '.',
                    $root/Input/Generation/Platform,
                    '.csproj'))" />
                </xsl:attribute>
                <Project>{<xsl:value-of select="$target_project/ProjectGuids/Platform[@Name=$root/Input/Generation/Platform]" />}</Project>
                <Name><xsl:value-of select="$target_project/@Name" /><xsl:text>.</xsl:text><xsl:value-of select="$root/Input/Generation/Platform" /></Name>
                <xsl:for-each select="./Alias">
                    <xsl:if test="@Platform = $root/Input/Generation/Platform">
                        <Aliases><xsl:value-of select="." /></Aliases>
                    </xsl:if>
                </xsl:for-each>
            </ProjectReference>
        </xsl:when>
        <xsl:when test="$target_project/@Language = 'C++'">
            <Reference>
                <xsl:attribute name="Include">
                    <xsl:value-of select="$target_project/@Name" />
                    <xsl:text>Binding</xsl:text>
                </xsl:attribute>
                <xsl:variable name="cpp_binding_path">
                    <xsl:value-of select="$target_project/@Path" />
                    <xsl:text>\bin\</xsl:text>
                    <xsl:value-of select="$target_project/@Name" />
                    <xsl:text>Binding.dll</xsl:text>
                </xsl:variable>
                <HintPath>
                    <xsl:value-of
                            select="user:GetRelativePath(
                  $root/Input/Generation/WorkingDirectory,
                  concat(
                    $source_project/@Path,
                    '\',
                    $source_project/@Name,
                    '.',
                    $root/Input/Generation/Platform,
                    '.srcproj'),
                  $cpp_binding_path)" />
                </HintPath>
            </Reference>

        </xsl:when>
        <xsl:otherwise>
            <xsl:message terminate="yes">
                <xsl:text>The project </xsl:text>
                <xsl:value-of select="$target_project_name" />
                <xsl:text>does not have a known language (it was '</xsl:text>
                <xsl:value-of select="$target_project/@Language" />
                <xsl:text>').</xsl:text>
            </xsl:message>
        </xsl:otherwise>
    </xsl:choose>
</xsl:if>
</xsl:template>

<xsl:template name="ReferenceToProtobuildProjectDllConfig"
              xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
<xsl:param name="target_project_name" />
<xsl:param name="source_project_name" />

<xsl:variable
        name="target_project"
        select="$root/Input/Projects/Project[@Name=$target_project_name]" />
<xsl:variable
        name="source_project"
        select="$root/Input/Projects/Project[@Name=$source_project_name]" />

<xsl:if test="user:ProjectIsActive(
      $target_project/@Platforms,
      '',
      '',
      $root/Input/Generation/Platform)">

    <xsl:choose>
        <xsl:when test="$target_project/@Language = 'C#'">
        </xsl:when>
        <xsl:when test="$target_project/@Language = 'C++'">
            <xsl:if test="$root/Input/Generation/Platform = 'Linux'">
                <None>
                    <xsl:variable name="config_path">
                        <xsl:value-of select="$target_project/@Path" />
                        <xsl:text>\bin\</xsl:text>
                        <xsl:value-of select="$target_project/@Name" />
                        <xsl:text>Binding.dll.config</xsl:text>
                    </xsl:variable>
                    <xsl:attribute name="Include">
                        <xsl:value-of
                                select="user:GetRelativePath(
                    $root/Input/Generation/WorkingDirectory,
                    concat(
                      $source_project/@Path,
                      '\',
                      $source_project/@Name,
                      '.',
                      $root/Input/Generation/Platform,
                      '.srcproj'),
                    $config_path)" />
                    </xsl:attribute>
                    <Link>
                        <xsl:value-of select="$target_project/@Name" />
                        <xsl:text>Binding.dll.config</xsl:text>
                    </Link>
                    <CopyToOutputDirectory>PreserveNewest</CopyToOutputDirectory>
                    <NativeBinary>True</NativeBinary>
                </None>
            </xsl:if>
        </xsl:when>
        <xsl:otherwise>
            <xsl:message terminate="yes">
                <xsl:text>The project </xsl:text>
                <xsl:value-of select="$target_project_name" />
                <xsl:text>does not have a known language (it was '</xsl:text>
                <xsl:value-of select="$target_project/@Language" />
                <xsl:text>').</xsl:text>
            </xsl:message>
        </xsl:otherwise>
    </xsl:choose>
</xsl:if>
</xsl:template>

<xsl:template name="ReferenceToExternalProject"
              xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
<xsl:param name="external_project" />
<xsl:param name="source_project" />

<ProjectReference>
    <xsl:attribute name="Include">
        <xsl:value-of
                select="user:GetRelativePath(
            $root/Input/Generation/WorkingDirectory,
            concat(
              $source_project/@Path,
              '\',
              $source_project/@Name,
              '.',
              $root/Input/Generation/Platform,
              '.srcproj'),
            $external_project/@Path)" />
    </xsl:attribute>
    <Project>{<xsl:value-of select="$external_project/@Guid" />}</Project>
    <Name><xsl:value-of select="$external_project/@Name" /></Name>
    <xsl:for-each select="$external_project/Alias">
        <xsl:if test="@Platform = $root/Input/Generation/Platform">
            <Aliases><xsl:value-of select="." /></Aliases>
        </xsl:if>
    </xsl:for-each>
</ProjectReference>
</xsl:template>

<xsl:template name="ReferenceToBinary"
              xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
<xsl:param name="binary" />
<xsl:param name="source_project" />

<Reference>
    <xsl:attribute name="Include">
        <xsl:value-of select="$binary/@Name" />
    </xsl:attribute>
    <xsl:for-each select="$binary/Alias">
        <xsl:if test="@Platform = $root/Input/Generation/Platform">
            <Aliases><xsl:value-of select="." /></Aliases>
        </xsl:if>
    </xsl:for-each>
    <HintPath>
        <xsl:value-of
                select="user:GetRelativePath(
            $root/Input/Generation/WorkingDirectory,
            concat(
              $source_project/@Path,
              '\',
              $source_project/@Name,
              '.',
              $root/Input/Generation/Platform,
              '.srcproj'),
            $binary/@Path)" />
    </HintPath>
    <xsl:choose>
        <xsl:when test="@LocalCopy">
            <Private><xsl:value-of select="@LocalCopy" /></Private>
        </xsl:when>
    </xsl:choose>
</Reference>
</xsl:template>

<xsl:template name="ReferenceToGAC"
              xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
<xsl:param name="gac" />

<Reference>
    <xsl:attribute name="Include">
        <xsl:value-of select="$gac/@Include" />
    </xsl:attribute>
    <xsl:for-each select="$gac/Alias">
        <xsl:if test="@Platform = $root/Input/Generation/Platform">
            <Aliases><xsl:value-of select="." /></Aliases>
        </xsl:if>
    </xsl:for-each>
</Reference>
</xsl:template>

<xsl:template name="AddFiles"
              xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
<xsl:param name="project" />
<xsl:param name="item_type" />

<xsl:for-each select="$project/Files/*[name()=$item_type]">
    <xsl:if test="user:ProjectAndServiceIsActive(
                ./Platforms,
                ./IncludePlatforms,
                ./ExcludePlatforms,
                ./Services,
                ./IncludeServices,
                ./ExcludeServices,
                $root/Input/Generation/Platform,
                $root/Input/Services/ActiveServicesNames)">
        <xsl:element
                name="{name()}"
                namespace="http://schemas.microsoft.com/developer/msbuild/2003">
            <xsl:attribute name="Include">
                <xsl:value-of select="@Include" />
            </xsl:attribute>
            <xsl:if test="@Exclude">
                <xsl:attribute name="Exclude">
                    <xsl:value-of select="@Exclude" />
                </xsl:attribute>
            </xsl:if>
            <xsl:apply-templates select="node()"/>
        </xsl:element>
    </xsl:if>
</xsl:for-each>
</xsl:template>

<xsl:template name="AddFilesFromInclude"
              xmlns="http://schemas.microsoft.com/developer/msbuild/2003">
<xsl:param name="include_project" />
<xsl:param name="target_project" />
<xsl:param name="item_type" />

<xsl:if test="user:ProjectIsActive($include_project/@Platforms, $root/Input/Generation/Platform)">
    <xsl:for-each select="$include_project/Files/*[name()=$item_type]">
        <xsl:if test="user:ProjectAndServiceIsActive(
                  ./Platforms,
                  ./IncludePlatforms,
                  ./ExcludePlatforms,
                  ./Services,
                  ./IncludeServices,
                  ./ExcludeServices,
                  $root/Input/Generation/Platform,
                  $root/Input/Services/ActiveServicesNames)">
            <xsl:element
                    name="{name()}"
                    namespace="http://schemas.microsoft.com/developer/msbuild/2003">
                <xsl:attribute name="Include">
                    <xsl:value-of select="user:GetRelativePath(
                $root/Input/Generation/WorkingDirectory,
                concat(
                  $root/Input/Generation/RootPath,
                  $target_project/@Path,
                  '\',
                  $target_project/@Name,
                  '.',
                  $root/Input/Generation/Platform,
                  '.srcproj'),
                concat(
                  $root/Input/Generation/RootPath,
                  $include_project/@Path,
                  '\',
                  current()/@Include))" />
                </xsl:attribute>
                <xsl:choose>
                    <xsl:when test="./Link">
                        <!-- The Link tag will be included by apply-templates -->
                    </xsl:when>
                    <xsl:otherwise>
                        <Link>
                            <xsl:text>Included Code\</xsl:text>
                            <xsl:value-of select="user:StripLeadingDotPaths($include_project/@Path)"/>
                            <xsl:text>\</xsl:text>
                            <xsl:value-of select="current()/@Include" />
                        </Link>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:apply-templates select="node()"/>
                <FromIncludeProject>True</FromIncludeProject>
            </xsl:element>
        </xsl:if>
    </xsl:for-each>
</xsl:if>
</xsl:template>

<xsl:template match="/">

<xsl:variable
        name="project"
        select="$root/Input/Projects/Project[@Name=$root/Input/Generation/ProjectName]" />

<xsl:variable name="ToolsVersion">
    <xsl:value-of select="user:GetLatestSupportedMSBuildToolsetVersionForPlatform(/Input/Generation/HostPlatform,/Input/Generation/Platform)" />
</xsl:variable>

<Project
        DefaultTargets="Build"
        xmlns="http://schemas.microsoft.com/developer/msbuild/2003" ToolsVersion="{$ToolsVersion}">

<xsl:if test="$root/Input/Generation/Platform = 'Windows8' or $root/Input/Generation/Platform = 'WindowsPhone81' or $root/Input/Generation/Platform = 'WindowsUniversal' or $root/Input/Generation/Platform = 'PCL' or user:IsTrue($root/Input/Properties/ForcePCL)">
    <Import Project="$(MSBuildExtensionsPath)\$(MSBuildToolsVersion)\Microsoft.Common.props" Condition="Exists('$(MSBuildExtensionsPath)\$(MSBuildToolsVersion)\Microsoft.Common.props')" />
</xsl:if>

<PropertyGroup>
    <Configuration Condition=" '$(Configuration)' == '' ">Debug</Configuration>
    <xsl:choose>
        <xsl:when test="$root/Input/Properties/ForceArchitecture">
            <Platform Condition=" '$(Platform)' == '' ">
                <xsl:value-of select="$root/Input/Properties/ForceArchitecture" />
            </Platform>
        </xsl:when>
        <xsl:otherwise>
            <Platform Condition=" '$(Platform)' == '' ">AnyCPU</Platform>
        </xsl:otherwise>
    </xsl:choose>
    <xsl:choose>
        <xsl:when test="$root/Input/Generation/Platform = 'WindowsUniversal'">
            <FileAlignment>512</FileAlignment>
        </xsl:when>
        <xsl:when test="$root/Input/Generation/Platform = 'Windows8' or $root/Input/Generation/Platform = 'WindowsPhone81'">
            <ProductVersion>8.0.30703</ProductVersion>
        </xsl:when>
        <xsl:otherwise>
            <ProductVersion>10.0.0</ProductVersion>
        </xsl:otherwise>
    </xsl:choose>
    <SchemaVersion>2.0</SchemaVersion>
    <ProjectGuid>{<xsl:value-of select="$project/ProjectGuids/Platform[@Name=$root/Input/Generation/Platform]" />}</ProjectGuid>
    <xsl:choose>
        <xsl:when test="$project/@Type = 'Website'">
            <ProjectTypeGuids>
                <xsl:text>{349C5851-65DF-11DA-9384-00065B846F21};</xsl:text>
                <xsl:text>{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}</xsl:text>
            </ProjectTypeGuids>
        </xsl:when>
        <xsl:when test="$root/Input/Generation/Platform = 'PCL' or user:IsTrue($root/Input/Properties/ForcePCL)">
            <ProjectTypeGuids>
                <xsl:text>{786C830F-07A1-408B-BD7F-6EE04809D6DB};</xsl:text>
                <xsl:text>{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}</xsl:text>
            </ProjectTypeGuids>
        </xsl:when>
        <xsl:when test="$root/Input/Generation/Platform = 'Android' or $root/Input/Generation/Platform = 'Ouya'">
            <ProjectTypeGuids>
                <xsl:text>{EFBA0AD7-5A72-4C68-AF49-83D382785DCF};</xsl:text>
                <xsl:text>{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}</xsl:text>
            </ProjectTypeGuids>
        </xsl:when>
        <xsl:when test="$root/Input/Generation/Platform = 'iOS'">
            <ProjectTypeGuids>
                <xsl:choose>
                    <xsl:when test="user:IsTrue($root/Input/Properties/UseLegacyiOSAPI)">
                        <xsl:text>{6BC8ED88-2882-458C-8E55-DFD12B67127B};</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:text>{FEACFBD2-3405-455C-9665-78FE426C6842};</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:text>{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}</xsl:text>
            </ProjectTypeGuids>
        </xsl:when>
        <xsl:when test="/Input/Generation/Platform = 'tvOS'">
            <ProjectTypeGuids>
                <xsl:text>{06FA79CB-D6CD-4721-BB4B-1BD202089C55};</xsl:text>
                <xsl:text>{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}</xsl:text>
            </ProjectTypeGuids>
        </xsl:when>
        <xsl:when test="$root/Input/Generation/Platform = 'MacOS'">
            <ProjectTypeGuids>
                <xsl:text>{A3F8F2AB-B479-4A4A-A458-A89E7DC349F1};</xsl:text>
                <xsl:text>{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}</xsl:text>
            </ProjectTypeGuids>
        </xsl:when>
        <xsl:when test="$root/Input/Generation/Platform = 'PSMobile'">
            <ProjectTypeGuids>
                <xsl:text>{69878862-DA7D-4DC6-B0A1-50D8FAB4242F};</xsl:text>
                <xsl:text>{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}</xsl:text>
            </ProjectTypeGuids>
        </xsl:when>
        <xsl:when test="$root/Input/Generation/Platform = 'Windows8'">
            <ProjectTypeGuids>
                <xsl:text>{BC8A1FFA-BEE3-4634-8014-F334798102B3};</xsl:text>
                <xsl:text>{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}</xsl:text>
            </ProjectTypeGuids>
        </xsl:when>
        <xsl:when test="$root/Input/Generation/Platform = 'WindowsPhone'">
            <ProjectTypeGuids>
                <xsl:text>{C089C8C0-30E0-4E22-80C0-CE093F111A43};</xsl:text>
                <xsl:text>{fae04ec0-301f-11d3-bf4b-00c04f79efbc}</xsl:text>
            </ProjectTypeGuids>
        </xsl:when>
        <xsl:when test="$root/Input/Generation/Platform = 'WindowsPhone81'">
            <ProjectTypeGuids>
                <xsl:text>{76F1466A-8B6D-4E39-A767-685A06062A39};</xsl:text>
                <xsl:text>{fae04ec0-301f-11d3-bf4b-00c04f79efbc}</xsl:text>
            </ProjectTypeGuids>
        </xsl:when>
        <xsl:when test="$root/Input/Generation/Platform = 'WindowsUniversal'">
            <ProjectTypeGuids>
                <xsl:text>{A5A43C5B-DE2A-4C0C-9213-0A381AF9435A};</xsl:text>
                <xsl:text>{FAE04EC0-301F-11D3-BF4B-00C04F79EFBC}</xsl:text>
            </ProjectTypeGuids>
        </xsl:when>
        <xsl:otherwise>
        </xsl:otherwise>
    </xsl:choose>
    <xsl:if test="$root/Input/Properties/WindowsApplicationIcon">
        <ApplicationIcon><xsl:value-of select="$root/Input/Properties/WindowsApplicationIcon" /></ApplicationIcon>
    </xsl:if>
    <OutputType>
        <xsl:choose>
            <xsl:when test="$project/@Type = 'App' or $project/@Type = 'Console'">
                <xsl:choose>
                    <xsl:when test="$root/Input/Generation/Platform = 'Android' or $root/Input/Generation/Platform = 'Ouya'">
                        <xsl:text>Library</xsl:text>
                    </xsl:when>
                    <xsl:when test="$root/Input/Generation/Platform = 'WindowsPhone'">
                        <xsl:text>Library</xsl:text>
                    </xsl:when>
                    <xsl:when test="$root/Input/Generation/Platform = 'WindowsPhone81'">
                        <xsl:text>Library</xsl:text>
                    </xsl:when>
                    <xsl:when test="$root/Input/Generation/Platform = 'Windows8' or $root/Input/Generation/Platform = 'WindowsUniversal'">
                        <xsl:text>AppContainerExe</xsl:text>
                    </xsl:when>
                    <xsl:when test="$root/Input/Generation/Platform = 'Windows'">
                        <xsl:choose>
                            <xsl:when test="$project/@Type = 'Console'">
                                <xsl:text>Exe</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:text>WinExe</xsl:text>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:when test="$root/Input/Generation/Platform = 'iOS' or $root/Input/Generation/Platform = 'tvOS'">
                        <xsl:text>Exe</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:text>Exe</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>Library</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </OutputType>
</PropertyGroup>

</xsl:template>
        </xsl:stylesheet>

