# Transformer

This is an implementation of [OpenAI's GPT-2 Transformer language model](https://github.com/openai/gpt-2) using [Swift for TensorFlow](https://github.com/tensorflow/swift).

Currently, the model must be run from the root of the swift-models project directory. You can run 
the model by sampling either unconditionally:

```sh
swift run -c release TransformerDemo [temperature]
```

or conditionally:

```sh
swift run -c release TransformerDemo [temperature] "conditioning text"
```

In either case, a "temperature" of 0 means "always output the same text, but it'll be fairly boring,"
a temperature of 1 means sampling exactly according to the model probabilities, and a temperature
higher than 1 means sampling more randomly than the model probabilities indicate. Values of 0.5-0.8 tend
to be best.

Here's one output we got:

```console
$ swift run -c release TransformerDemo 0.5 "Introducing Swift for TensorFlow"
Introducing Swift for TensorFlow

Swift has been around since the beginning. It was created by the Swift team to enable developers to write Swift code. It is a powerful language for developing many different types of data structures.

In this tutorial, we will show you how to use Swift to write a simple, simple TensorFlow program.
```

This code requires a Swift for TensorFlow toolchain.
To get a toolchain, you can:

1. [Download a pre-built package](https://github.com/tensorflow/swift/blob/master/Installation.md).
2. [Compile a toolchain from source](https://github.com/apple/swift/tree/tensorflow#building-swift-for-tensorflow).

# Windows UI

The Windows UI demo program relies on [Swift/Win32](https://github.com/compnerd/swift-win32).

Follow the directions for building the swift-models repository.  The
`TransformerUI` target can be built with `cmake` and `ninja` on Windows.  In
order to build this, the `CMAKE_Swift_FLAGS` will need to have include and
library search paths added (`-I` and `-L` with their respective values).

Assuming that the generated DLLs are in the `PATH`, it should be possible to
then execute the demo as `.\Transformer\TransformerUI.exe`.
