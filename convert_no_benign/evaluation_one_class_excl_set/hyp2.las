class(dos) :- rerror_rate(0), srv_rerror_rate(0), srv_diff_host_rate(0), logged_in(0), flag(s0), srv_serror_rate(100000).
class(dos) :- rerror_rate(0), srv_rerror_rate(0), srv_diff_host_rate(0), logged_in(0), flag(s0), srv_serror_rate(100000), service(private).
class(dos) :- service(http), srv_rerror_rate(0), srv_diff_host_rate(0), logged_in(0), flag(s0), srv_serror_rate(100000).
class(dos) :- srv_diff_host_rate(0), logged_in(0), service(netbios_ns).
class(dos) :- root_shell(0), srv_diff_host_rate(0), logged_in(0), service(csnet_ns).
class(probe) :- srv_rerror_rate(0), logged_in(0), srv_serror_rate(100000), service(x11), rerror_rate(67000), serror_rate(33000).
class(probe) :- rerror_rate(92000).
class(dos) :- logged_in(0), service(telnet), flag(s0), srv_serror_rate(100000).
class(dos) :- srv_diff_host_rate(0), service(ldap).
class(dos) :- srv_diff_host_rate(0), logged_in(0), service(systat).
class(probe) :- logged_in(0), serror_rate(0), rerror_rate(100000), srv_rerror_rate(100000), flag(rstr), service(other).
class(probe) :- rerror_rate(0), logged_in(0), serror_rate(100000), srv_serror_rate(100000), flag(sh).
class(dos) :- srv_rerror_rate(0), srv_diff_host_rate(0), logged_in(0), flag(s0), srv_serror_rate(100000), service(ftp_data).
class(probe) :- logged_in(0), rerror_rate(90000).
class(dos) :- srv_diff_host_rate(0), logged_in(0), service(kshell).
class(dos) :- srv_diff_host_rate(0), logged_in(0), service(courier).
class(dos) :- srv_rerror_rate(0), srv_diff_host_rate(0), logged_in(0), flag(s0), srv_serror_rate(100000), service(finger).
class(dos) :- service(http), logged_in(1), serror_rate(0), srv_serror_rate(0), rerror_rate(33000).
class(dos) :- logged_in(0), flag(s0), srv_serror_rate(100000), serror_rate(99000).
class(dos) :- root_shell(0), srv_diff_host_rate(0), logged_in(0), service(efs).
class(probe) :- flag(sf), rerror_rate(0), logged_in(0), srv_serror_rate(0), service(telnet).
class(dos) :- srv_diff_host_rate(0), logged_in(0), service(imap4).
class(probe) :- logged_in(0), serror_rate(0), srv_serror_rate(0), service(private), flag(rstr).
class(dos) :- logged_in(0), rerror_rate(100000), srv_rerror_rate(100000), flag(rsto).
class(dos) :- srv_diff_host_rate(0), flag(rej), logged_in(0), serror_rate(0), rerror_rate(100000), srv_rerror_rate(100000), service(private).
class(probe) :- logged_in(0), srv_rerror_rate(100000), rerror_rate(91000).
class(probe) :- flag(rej), logged_in(0), srv_serror_rate(0), srv_rerror_rate(100000), rerror_rate(84000).
class(dos) :- flag(s0), serror_rate(100000).
class(dos) :- srv_diff_host_rate(0), logged_in(0), service(name).
class(probe) :- flag(rej), logged_in(0), srv_rerror_rate(100000), rerror_rate(89000).
class(dos) :- flag(rej), logged_in(0), serror_rate(0), srv_serror_rate(0), rerror_rate(100000), srv_rerror_rate(100000), service(whois).
class(dos) :- srv_diff_host_rate(0), logged_in(0), service(http_443).
class(dos) :- srv_diff_host_rate(0), logged_in(0), service(netbios_ssn).
class(dos) :- srv_diff_host_rate(0), logged_in(0), service(netstat).
class(dos) :- srv_diff_host_rate(0), logged_in(0), service(ssh).
class(dos) :- srv_diff_host_rate(0), service(ctf).
class(probe) :- flag(rej), logged_in(0), srv_serror_rate(0), srv_rerror_rate(100000), serror_rate(1000).
class(dos) :- service(http), flag(sf), logged_in(1), rerror_rate(0), serror_rate(0), srv_serror_rate(0), srv_diff_host_rate(100000), srv_rerror_rate(67000).
class(dos) :- srv_diff_host_rate(0), logged_in(0), service(sql_net).
class(dos) :- root_shell(0), logged_in(0), flag(s0), serror_rate(100000).
class(dos) :- srv_diff_host_rate(0), logged_in(0), service(vmnet).
class(probe) :- flag(rej), logged_in(0), srv_rerror_rate(100000), rerror_rate(67000).
class(dos) :- srv_diff_host_rate(0), logged_in(0), service(z39_50).
class(dos) :- srv_diff_host_rate(0), service(nnsp).
class(probe) :- logged_in(0), srv_serror_rate(0), rerror_rate(100000), srv_rerror_rate(100000), service(ftp_data).
class(probe) :- logged_in(0), srv_rerror_rate(100000), serror_rate(4000).
class(dos) :- flag(rej), logged_in(0), srv_serror_rate(0), rerror_rate(100000), srv_rerror_rate(100000), service(ftp_data).
class(dos) :- srv_diff_host_rate(0), flag(rej), logged_in(0), srv_serror_rate(0), rerror_rate(100000), srv_rerror_rate(100000), service(netbios_dgm).
class(dos) :- service(http), flag(sf), root_shell(0), srv_rerror_rate(20000).
class(dos) :- service(http), root_shell(0), serror_rate(0), srv_serror_rate(0), rerror_rate(25000).
class(dos) :- srv_diff_host_rate(0), flag(rej), logged_in(0), serror_rate(0), srv_serror_rate(0), rerror_rate(100000), srv_rerror_rate(100000), service(gopher).
class(probe) :- srv_serror_rate(0), service(gopher).
class(probe) :- flag(rej), logged_in(0), srv_serror_rate(0), srv_rerror_rate(100000), rerror_rate(93000).
class(dos) :- srv_diff_host_rate(0), service(iso_tsap).
class(dos) :- root_shell(0), srv_diff_host_rate(0), logged_in(0), service(mtp).
class(dos) :- srv_diff_host_rate(0), flag(rej), srv_serror_rate(0), rerror_rate(100000), srv_rerror_rate(100000), service(domain).
class(dos) :- rerror_rate(0), srv_rerror_rate(0), logged_in(0), flag(s0), srv_serror_rate(100000), service(private).
class(dos) :- srv_diff_host_rate(0), service(bgp).
class(dos) :- srv_diff_host_rate(0), logged_in(0), service(klogin).
class(probe) :- flag(rstos0).
class(dos) :- srv_diff_host_rate(0), service(hostnames).
class(probe) :- flag(rej), logged_in(0), srv_serror_rate(0), srv_rerror_rate(100000), rerror_rate(82000).
class(dos) :- srv_diff_host_rate(0), flag(rej), rerror_rate(100000), srv_rerror_rate(100000), service(supdup).
class(probe) :- logged_in(0), flag(s0), serror_rate(100000), srv_serror_rate(100000), service(pop_3).
class(dos) :- root_shell(0), rerror_rate(0), logged_in(0), flag(s0), srv_serror_rate(100000).
class(u2r) :- flag(sf), root_shell(0), su_attempted(0), is_guest_login(0), rerror_rate(0), serror_rate(0), srv_serror_rate(0), service(ftp).
class(dos) :- service(http), srv_rerror_rate(17000).
class(dos) :- service(http), logged_in(1), root_shell(0), serror_rate(0), srv_serror_rate(0), flag(rstr).
class(dos) :- srv_diff_host_rate(0), flag(rej), logged_in(0), serror_rate(0), rerror_rate(100000), srv_rerror_rate(100000), service(auth).
class(probe) :- flag(rej), logged_in(0), srv_serror_rate(0), srv_rerror_rate(100000), service(remote_job), rerror_rate(97000).
class(probe) :- srv_diff_host_rate(0), serror_rate(3000).
class(probe) :- logged_in(0), srv_serror_rate(0), srv_rerror_rate(100000), service(other), rerror_rate(85000).
class(probe) :- logged_in(0), rerror_rate(100000), srv_rerror_rate(100000), flag(rstr), service(netbios_dgm).
class(probe) :- logged_in(0), flag(s0), srv_serror_rate(100000), serror_rate(64000).
class(probe) :- service(http), root_shell(0), su_attempted(0), logged_in(0), serror_rate(0), srv_rerror_rate(100000), flag(rstr).
class(probe) :- logged_in(0), rerror_rate(100000), srv_rerror_rate(100000), flag(rstr), service(discard).
class(probe) :- logged_in(0), srv_serror_rate(0), srv_rerror_rate(100000), service(other), rerror_rate(77000).
class(probe) :- srv_diff_host_rate(0), logged_in(0), serror_rate(20000), rerror_rate(80000).
class(dos) :- service(http), flag(sf), logged_in(1), srv_diff_host_rate(0), serror_rate(0), srv_serror_rate(0), rerror_rate(50000), srv_rerror_rate(50000).
class(dos) :- srv_diff_host_rate(0), service(link).
class(dos) :- service(http), flag(sf), logged_in(1), rerror_rate(0), srv_serror_rate(0), srv_diff_host_rate(50000), srv_rerror_rate(33000).
class(probe) :- logged_in(0), srv_serror_rate(0), srv_rerror_rate(100000), service(other), rerror_rate(86000).
class(probe) :- rerror_rate(87000).
class(probe) :- srv_rerror_rate(0), logged_in(0), serror_rate(0), service(private), flag(oth).
class(probe) :- flag(sf), rerror_rate(0), srv_rerror_rate(0), logged_in(0), serror_rate(0), service(domain).
class(probe) :- flag(rej), logged_in(0), srv_serror_rate(0), srv_rerror_rate(100000), serror_rate(11000).
class(probe) :- logged_in(0), srv_serror_rate(0), srv_rerror_rate(100000), service(other), serror_rate(21000).
class(dos) :- srv_diff_host_rate(0), service(uucp_path).
class(probe) :- flag(rej), logged_in(0), srv_serror_rate(0), srv_rerror_rate(100000), rerror_rate(81000).
class(dos) :- service(http), flag(sf), logged_in(1), rerror_rate(0), srv_rerror_rate(25000), srv_diff_host_rate(38000).
class(probe) :- logged_in(0), srv_rerror_rate(100000), service(private), rerror_rate(50000).
class(dos) :- root_shell(0), rerror_rate(0), srv_rerror_rate(0), logged_in(0), flag(s0), srv_serror_rate(100000), service(private).
class(probe) :- logged_in(0), rerror_rate(100000), srv_rerror_rate(100000), flag(rstr), service(whois).
class(probe) :- logged_in(0), rerror_rate(100000), srv_rerror_rate(100000), flag(rstr), service(shell).
class(probe) :- flag(sf), srv_rerror_rate(0), logged_in(0), srv_serror_rate(0), service(ftp), rerror_rate(33000).