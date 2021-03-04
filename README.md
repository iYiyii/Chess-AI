# Chess-AI

## Requirements

* GHC
* Cabal

## Usage

### Run the Game

```
cabal run Chess-AI
```

### Run Tests

#### Install Dependencies

```
cabal install pretty-tree --install-method=copy --lib
cabal install HTF --install-method=copy
```

#### Run all tests

```
cabal test all
```