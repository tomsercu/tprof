require 'prof-torch'

prof.tic()
os.execute('sleep 0.05')
print(prof.toc())

prof.tic('foo')
os.execute('sleep 0.1')
prof.toc('foo')

prof.tic('foo')
os.execute('sleep 0.1')
prof.tic('foobar')
os.execute('sleep 0.1')
prof.toc('foobar')
prof.toc('foo')

prof.dump()
