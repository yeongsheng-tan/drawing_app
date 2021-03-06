# DrawingApp
#### A simple console drawing program.
#### The currently implemented features allow you to perform the following action
##### [Source on Github](https://github.com/yeongsheng-tan/drawing_app)
---
###### 1. Creates a new canvas for a specified positive integer width and height (max of 50 x 50 allowed)
###### 2. Quit
---
## Installation for running the compiled Erlang BEAM binary 'drawing-app'
1. Install erlang version **20.3** for your target Operating System, see ([details](https://www.erlang-solutions.com/resources/download.html))

   1.1 On macOS High Sierra, run:
   ```
   brew install erlang
   ```
   
   1.2 On a Debian Stretch 64-bit OS, run:
   ```
   wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb
   sudo dpkg -i erlang-solutions_1.0_all.deb
   sudo apt-get update && sudo apt-get install erlang
   ```
  
   1.3 On a CentOS 7.x 64-bit OS, run:
   ```
   wget https://packages.erlang-solutions.com/erlang-solutions-1.0-1.noarch.rpm
   sudo rpm -Uvh erlang-solutions-1.0-1.noarch.rpm
   sudo yum update && sudo yum install erlang
   ```
   
   1.4 WILL NOT WORK IN MS WINDOWS (Erlang **20.3** not yet released for MS Windows)

2. Run the app from the root of the downloaded gzip tarball exploded directory:
```
wget https://goo.gl/sWqyBo
tar xvzf drawing_app.tar.gz
cd drawing_app
./drawing_app
```

2.1 You should see the following console output once the above runs successfully:
```
➜ ~/g/drawing_app ./drawing_app
Welcome to the Drawing App

The Drawing App supports the following commands:

  C - format: "C w h". Creates a new canvas of width w and height h. Max canvas size 50x50. If w and/or h not provided, canvas defaults to 50x50
  Q - Quits the program
enter command:
```


## Installation for running the elixir unit tests
1. Install elixir version **1.6.x** for your target Operating System, see ([details](https://www.erlang-solutions.com/resources/download.html))

   1.1 On macOS High Sierra, run:
   ```
   brew install elixir
   ```
   
   1.2 On a Debian Stretch 64-bit OS, run:
   ```
   wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb
   sudo dpkg -i erlang-solutions_1.0_all.deb
   sudo apt-get update && sudo apt-get install elixir
   ```
 
 2. Run the unit tests from the root of this project's directory:
 ```
 mix test
 ```


## Build escript for the 'drawing_app'
##### An escript is an executable that can be invoked from the command line. An escript can run on any machine that has Erlang/OTP installed and by default does not require Elixir to be installed, as Elixir is embedded as part of the escript
------
1. Install elixir version **1.6.x** for your target Operating System, see ([details](https://www.erlang-solutions.com/resources/download.html))
2. On macOS High Sierra or Debian Stretch 64-bit OS, then run the escript build command from the root of this project's directory:
```
mix escript.build
```
3. The cross-platform escript binary is available at the root of this project's directory as 'drawing_app'
4. Run the binary with:
```
./drawing_app
```
