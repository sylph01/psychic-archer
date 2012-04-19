# coding: utf-8

# source and destination directory with slash
source = "./source/"
destination = "./destination/"

# match pattern
pattern = "<!-- sidebar -->"
# template file
template_file = "sidebar.txt"

tf = open(template_file)
template = tf.read
tf.close

# for each file in data directory, parse
Dir::foreach(source) { |fname|
	if (File::extname(fname) == ".html")
		f = open(source + fname)
		content = f.read
		f.close
		
		# change pattern
		content.gsub!(pattern, template)
		
		# write to destination
		outf = open(destination + fname, "w")
		outf.print content
		outf.close
	else
		f = open(source + fname)
		content = f.read
		f.close
		# simply copy if not html
		outf = open(destination + fname, "w")
		outf.print content
		outf.close
	end
}
