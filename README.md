# TranceCalc

## TranceCalcは、あなたの好きな記号を算術演算子に組み込み、電卓インタプリターを生成します。  

# 使用方法
  
* 利用の際にはyaccとlexをインストールしなければなりません。  

```
$ sudo apt install bison
```  
でyaccをインストールできます。

```
$ sudo apt install flex
``` 
でlexをインストールできます。  

* また、Rubyによる生成を行いますのでRubyもインストールしておいてください。  

```
$ ruby trancecalcmaker.rb
```
で電卓インタプリター定義プログラムが起動しますので、プログラムの案内通りにあなたの好きな算術演算子を定義すればインタプリターが生成されます。  
インタプリター起動方法は、  

```
$ cd trancecalc
$ ./trancecalc
```
で起動します。  

終了方法は、ctrl + c で終了できます。  
  
製作者：　Iovesophy
