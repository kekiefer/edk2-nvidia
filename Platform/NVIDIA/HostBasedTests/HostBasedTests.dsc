#Copyright (c) 2021-2022 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
#
# SPDX-License-Identifier: BSD-2-Clause-Patent

[Defines]
  PLATFORM_NAME                  = HostBasedTests
  PLATFORM_GUID                  = fb5efb94-61c8-42e0-9cb4-a33ba4e4aec8
  OUTPUT_DIRECTORY               = Build/HostBasedTests
  SKUID_IDENTIFIER               = ALL
  PLATFORM_VERSION               = 0.1
  DSC_SPECIFICATION              = 0x00010005
  SUPPORTED_ARCHITECTURES        = IA32|X64
  BUILD_TARGETS                  = DEBUG|RELEASE|NOOPT

!include Platform/NVIDIA/HostBasedTests/HostBasedTests.dsc.inc

[Components]
  #
  # FvbDxe Host Based UnitTest Support
  #
  Silicon/NVIDIA/Drivers/FvbDxe/UnitTest/FvbDxeUnitTestsHost.inf {
    <LibraryClasses>
      NULL|Silicon/NVIDIA/Drivers/FvbDxe/FvbDxe.inf
      PcdLib|Silicon/NVIDIA/Drivers/FvbDxe/UnitTest/FvbPcdStubLib/FvbPcdStubLib.inf
  }

  # PlatformResourceStubLib
  Silicon/NVIDIA/Library/HostBasedTestStubLib/PlatformResourceStubLib/UnitTest/PlatformResourceStubLibUnitTests.inf {
    <LibraryClasses>
      NULL|Silicon/NVIDIA/Library/HostBasedTestStubLib/PlatformResourceStubLib/PlatformResourceStubLib.inf
  }

  # TegraPlatformInfoStubLib
  Silicon/NVIDIA/Library/HostBasedTestStubLib/TegraPlatformInfoStubLib/UnitTest/TegraPlatformInfoStubLibUnitTests.inf {
    <LibraryClasses>
      NULL|Silicon/NVIDIA/Library/HostBasedTestStubLib/TegraPlatformInfoStubLib/TegraPlatformInfoStubLib.inf
  }

[PcdsDynamicDefault]
  gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageVariableSize|0x00010000
  gEfiMdeModulePkgTokenSpaceGuid.PcdFlashNvStorageVariableBase64|0x0
  gEfiMdeModulePkgTokenSpaceGuid.PcdEmuVariableNvModeEnable|FALSE
