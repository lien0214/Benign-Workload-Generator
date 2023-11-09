Based on the manual you've provided, `xdisk` seems to be a comprehensive I/O performance testing tool with various options to customize your testing scenarios. Here’s a step-by-step guide on how to use `xdisk` to test your I/O performance:

1. **Choose the I/O Test Type**:
   - For sequential I/O test: `-S` or `-S1`
   - For random I/O test: `-R` or `-R1`

2. **Specify the File or Device**:
   - Use `-f` followed by the file or device path to specify where the I/O operations should be performed.

3. **Set the Test Duration**:
   - Use `-t` followed by the number of seconds you want the test to run.

4. **Determine the Number of Processes**:
   - Use `-M` to specify the number of processes that should be used to generate I/O.

5. **Set Block and File Sizes**:
   - Use `-b` for block size and `-C` to create a file of a specified size if needed.

6. **Specify Access Modes**:
   - Use `-O` followed by flags like `D` for `O_DIRECT` to avoid file system cache during the test.

7. **Adjust Additional Parameters**:
   - Set read/write ratios with `-r`, snooze percentages with `-z`, or file sizes for raw devices with `-s`.

Here is an example command to start a simple test:

```sh
xdisk -S -f /path/to/testfile -t 300 -M 4 -b 4K -O D
```

This command will start a sequential I/O test on `/path/to/testfile` with a duration of 5 minutes (300 seconds), using 4 processes, a block size of 4KB, and direct I/O access to bypass the file system cache.

If you want to create a file for testing, you might use:

```sh
xdisk -C 100M -f /path/to/testfile -R -t 300 -M 4 -O D
```

This creates a 100 MB file and performs random I/O for 300 seconds with 4 processes and direct I/O access.

Remember to replace `/path/to/testfile` with the actual file path or device you want to test against. Additionally, adjust the parameters as necessary for your testing requirements.

If you have a set of files, you could use `-F` to specify a file containing a list of files to be tested.

It is also recommended to consult the documentation or help command (usually `xdisk -h` or `xdisk --help`) for more detailed explanations of each parameter, especially if you have specific needs or want to conduct more complex tests. Also, ensure you have the right permissions to access the files or devices you are testing.