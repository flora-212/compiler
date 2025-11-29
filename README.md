# CMinus Compiler with Intermediate Code Optimization
## 📖 Project Overview

This project is a complete **CMinus language compiler** developed as part of a compiler course experiment at USTC. Built on top of a framework provided by teaching assistants, this implementation features a full compilation pipeline from source code to optimized assembly, covering all major phases of modern compiler design.

### What is CMinus?
CMinus is a subset of the C programming language designed for educational purposes, supporting basic constructs like variables, functions, control flow, and arrays.

### Key Achievements
- **Complete compiler pipeline**: Lexical analysis → Parsing → IR generation → Optimization → Code generation
- **Advanced optimizations**: SSA-based transformations including Mem2Reg, Dead Code Elimination, and Loop-Invariant Code Motion
- **Custom IR framework**: Educational wrapper around LLVM for better understanding of compiler internals
- **Production-quality techniques**: Dominator analysis, phi-function placement, and register allocation

## 🔨 Features
1. **Lexical and Syntax Analysis**
   - Implemented using **Flex** and **Bison**.
   - Supports parsing of **CMinus language** constructs.
   - Builds an abstract syntax tree (AST) for program structure.

2. **Intermediate Code Generation**
   - Translates the syntax tree into **LLVM Intermediate Representation (IR)**.
   - Provides a structured and analyzable intermediate layer before assembly.

3. **Assembly Translation**
   - Converts LLVM IR into **Loongson assembly instructions**.
   - Demonstrates end-to-end compilation from source to target machine code.

4. **Intermediate Code Optimization**
   - Constructed **Dominator Tree** to analyze program flow and enable advanced optimizations.
   - Implemented **Mem2Reg optimization** (Memory-to-Register promotion):
     - Inserted **ϕ (phi) functions** at join points in the control flow graph.
     - Performed **variable renaming** to convert to Static Single Assignment (SSA) form.
   - **Dead Code Elimination (DCE)**: Removed unreachable code and unused computations.
   - **Loop-Invariant Code Motion (LICM)**: Moved invariant computations outside loops.
   - Eliminated redundant **memory operations** to improve performance.

## 📂 Project Structure

- `src/` - Source code implementation
  - `parser/` - Lexical & syntax analysis (Flex & Bison)
  - `lightir/` - LLVM IR abstraction layer
  - `passes/` - Optimization passes (Mem2Reg, DCE, LICM, etc.)
  - `codegen/` - Assembly code generation
- `tests/` - Test cases (parser, IR generation, codegen, optimization)
- `examples/` - Sample CMinus programs


## 🛠️ Build & Usage

### Prerequisites
- **CMake** (>= 3.8)
- **LLVM** development libraries
- **Flex** & **Bison**
- **C++17** compatible compiler

### Building
```bash
# Clone the repository
git clone https://github.com/flora-212/compilor.git
cd compiler

# Create build directory
mkdir build && cd build

# Configure and build
cmake ..
make -j
```

## 🚀 Quick Start Example

### Running the Hello World Example

The project includes sample programs in the `examples/` directory. Here's a complete example of compiling and running a CMinus program:

```bash
# Step 1: Generate LLVM IR from CMinus source
./build/cminusfc -emit-llvm -o examples/hello.ll examples/hello.cminus

# Step 2: Compile IR to object file (requires llc)
llc -filetype=obj examples/hello.ll -o examples/hello.o

# Step 3: Link with runtime library to create executable
gcc examples/hello.o build/libcminus_io.a -o examples/hello -lm -no-pie

# Step 4: Run the program
./examples/hello
```

#### Expected Output
- `hello.cminus` outputs: `123`
- `hellohello.cminus` outputs: `42`


## 🧪 Testing

The project includes a comprehensive test suite covering all compiler phases. Each test category validates different aspects of the compilation pipeline.

### Test Categories

| Test Phase          | Directory                  | Purpose                                   | Key Scripts                        |
| ------------------- | -------------------------- | ----------------------------------------- | ---------------------------------- |
| **Frontend**        | `tests/1-parser/`          | Lexical & syntax analysis, AST generation | `eval_phase1.sh`, `eval_phase2.sh` |
| **IR Generation**   | `tests/2-ir-gen/`          | AST to LLVM IR translation                | `autogen/eval_lab2.sh`             |
| **Code Generation** | `tests/3-codegen/`         | IR to assembly conversion                 | `autogen/eval_lab3.sh`             |
| **Optimization**    | `tests/4-opt/`             | Optimization pass correctness             | `eval_lab4.sh`                     |
| **General**         | `tests/testcases_general/` | End-to-end validation                     | Various `.cminus` files            |

### Running Tests

#### 1. Parser Tests 
```bash
cd tests/1-parser
./eval_phase1.sh -all    # Test syntax tree generation
./eval_phase2.sh -all    # Test AST generation
```

#### 2. IR Generation Tests 
```bash
cd tests/2-ir-gen/autogen
./eval_lab2.sh           # Python-based IR validation
```

#### 3. Code Generation Tests 
```bash
cd tests/3-codegen/autogen
./eval_lab3.sh
```
*Compiles to assembly, links with runtime, and runs under QEMU*

#### 4. Optimization Tests
```bash
cd tests/4-opt
./eval_lab4.sh mem2reg ../testcases_general test    # Test Mem2Reg optimization
./eval_lab4.sh licm ../testcases_general test       # Test LICM optimization
```

## 🔗 References

### Technical Documentation
- [LLVM Documentation](https://llvm.org/docs/) - IR framework and optimization techniques
- [Flex & Bison Manual](https://www.gnu.org/software/bison/manual/) - Lexer and parser generators
- [CMake Documentation](https://cmake.org/documentation/) - Build system configuration


## Acknowledgments

This project was developed as part of the compiler course at USTC. The initial framework and test infrastructure were provided by the course teaching team.

---
*A complete CMinus compiler implementation demonstrating modern compilation techniques and optimization passes.*
