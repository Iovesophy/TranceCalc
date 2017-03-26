# coding: utf-8
puts "*-------------------------\\"
puts "|  Trance Calc [ver-0.1]  |"
puts "\\-------------------------*"
puts ""
puts "----> makeing start <----"
puts ""
puts "足し算のオペレーターを決めて入力してください:"
add = gets.chomp.to_s
puts "引き算のオペレーターを決めて入力してください:"
sub = gets.chomp.to_s
puts "掛け算のオペレーターを決めて入力してください:"
mul = gets.chomp.to_s
puts "割り算のオペレーターを決めて入力してください:"
div = gets.chomp.to_s

File.open("calc.l","w") do |code|
	code.puts "%%"
	code.puts "\"#{add}\"             return ADD;"
	code.puts "\"#{sub}\"             return SUB;"
	code.puts "\"#{mul}\"             return MUL;"
	code.puts "\"#{div}\"             return DIV;"
	code.puts "\"\\n\"                return NL;"
	code.puts ""
	code.puts "([1-9][0-9]*)|0|([0-9]+\\.[0-9]*) {"
        code.puts "double temp;"
        code.puts "sscanf(yytext, \"%lf\", &temp);"
        code.puts "yylval.double_value = temp;"
        code.puts "return NUM;"
	code.puts "};"
	code.puts ""
	code.puts "[ \\t] ;"
	code.puts ""
	code.puts ". {"
        code.puts "fprintf(stderr, \"lexical error!!1!1!\\n\");"
        code.puts "exit(1);"
	code.puts "}"
	code.puts ""
	code.puts "%%"
end

system('lex calc.l')
system('yacc -dv calc.y')
system('cc -o trancecalc y.tab.c')

puts ""
puts "----> complete!!1! <----"

