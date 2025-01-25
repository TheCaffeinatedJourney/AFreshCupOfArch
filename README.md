# AFreshCupOfArch
 Automated Arch Linux installation script with LVM on LUKS
> **Warning**
> This project is in active development, is not yet complete, and may have breaking changes. Use at your own risk.

## Overview
AFreshCupOfArch is an automated installation script for Arch Linux that sets up LVM (Logical Volume Management) on LUKS encryption. This provides a secure and flexible storage configuration.

## Prerequisites
- A bootable Arch Linux installation media
- Basic familiarity with Linux and disk encryption concepts
- Internet connection during installation

## Configuration
Before running the installation, you need to configure the installation parameters in `install.conf`. This file contains important settings like:

- Disk and partition information
- Encryption settings
- Volume group and logical volume configurations
- System settings (hostname, timezone, etc.)
- User account details

## Installation Steps

1. Boot into the Arch Linux live environment
2. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/AFreshCupOfArch.git
   cd AFreshCupOfArch
   ```
3. Configure your installation parameters in `install.conf`
4. Run the installation script:
   ```bash
   ./install.sh
   ```

## Contributing
Contributions are welcome! Please feel free to submit pull requests or open issues for any bugs or feature requests.

## License
[Add your chosen license here]

