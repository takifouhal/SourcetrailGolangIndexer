# SourcetrailGolangIndexer

Golang Indexer for Sourcetrail.

![](./img/println.png)

## Description

The SourcetrailGolangIndexer is a language extension for Sourcetrail that provides support for Golang. Although this project is still in its early stages, it allows you to generate an accurate call graph for your Golang project.

## Setup

The SourcetrailGolangIndexer can now be built on both Linux and macOS platforms.

### Prerequisites

- CMake (3.10 or later)
- SWIG
- Go
- C++ compiler with C++11 support

### Building from Source

1. Clone the repository:
```bash
git clone https://github.com/yourusername/SourcetrailGolangIndexer.git
cd SourcetrailGolangIndexer
```

2. Build the bindings:
```bash
cd bindings_golang
cmake .
make
```

This will generate:
- On macOS: `sourcetraildb.dylib`
- On Linux: `sourcetraildb.so`

### Running

You can either check the `run.sh` script or execute it directly. This project relies solely on native tools supported by golang.org and doesn't have any third-party dependencies.

Once you have executed the `run.sh` script, you should have the following:

![](./img/example.png)

For information on how to use Sourcetrail, please refer to its official website.

## TODO

- Add support for class hierarchy
- Add comprehensive test suite
- Add Windows support

## Project Status

As of March 10th, 2022, I have completed a runnable version of this extension, which was finalized in April 2021. However, I discovered that the master branch of the project has since been archived, meaning I cannot make a pull request. Unfortunately, this also means that there will be no further progress on the project.

### Alternative Tools

There are other heuristic projects like goplantuml that perform similar functions, but with standard plantuml output. You may find these projects to be more suitable for your needs.

## Contributing

While the original Sourcetrail project is archived, this fork remains maintained for those who still find value in using Sourcetrail with Go projects. Contributions, especially for improving platform support and fixing bugs, are welcome.

## Building Issues

If you encounter any building issues:

1. Make sure you have the latest version of CMake and SWIG installed
2. Check that your C++ compiler supports C++11
3. On macOS, ensure you're using the latest Xcode command line tools
4. Try cleaning the build directory and rebuilding:
   ```bash
   cd bindings_golang
   rm -rf CMakeCache.txt CMakeFiles cmake_install.cmake Makefile
   cmake .
   make
   ```
