pragma circom 2.0.0;

include "D:\random\circom-circom\node_modules\circomlib\circuits\poseidon.circom";
// Signals are always considered private.
// The programmer can distinguish between public and private signals only when defining the main component,
// by providing the list of public input signals.

// all output signals of the main component are public
// Signals are immutable, this value cannot be changed any more
// out <== 0;
// out <== comp.outA;

// Compilation error since value of signal outA depends on the value of signal in
// Signals can only be assigned using the operations <-- or <==

// Variables are identifiers that hold non-signal data and are mutable

// An assignment is a statement and does not return any value
// damn that means if(x=3) will give compilation error

// Instantiation by component c = tempid(v1,...,vn)

// Important to provide constraints to every signal
// Even in*0 === 0 works

// @notice We'll use Poseidon Hash to start with

template checkHash(){
    signal input preimage;
    signal output hash;

    component hasher = Poseidon(1);
    hasher.inputs[0] <== preimage;

    hash <== hasher.out;
}

component main = checkHash();