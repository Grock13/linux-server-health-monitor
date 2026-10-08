# Troubleshooting Notes

## Script will not run

Check permissions:

```bash
ls -l health-check.sh

## Report file not created

Check that the script has write access to the current directory.

Use:

```bash
pwd
ls -ld .
