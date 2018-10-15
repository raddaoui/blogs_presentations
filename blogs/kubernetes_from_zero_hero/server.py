import socket

HOST = ''
PORT = 8888
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.bind((HOST, PORT))
s.listen(1)
while True: # accept a new connection if client terminates session
  conn, addr = s.accept()
  print 'Connected by', addr
  while True:
    data = conn.recv(1024)
    if not data: break
    reply_msg = 'hi from ' + socket.gethostname() + '\n'
    reply_msg += 'you sent: ' + data
    conn.send(reply_msg)
  conn.close()
