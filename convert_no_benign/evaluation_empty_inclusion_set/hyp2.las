class(dos) :- flag(s0), logged_in(0), srv_serror_rate(100000), rerror_rate(0), srv_rerror_rate(0), srv_diff_host_rate(0).
class(dos) :- flag(s0), logged_in(0), srv_serror_rate(100000), rerror_rate(0).
class(dos) :- flag(s0), logged_in(0), srv_serror_rate(100000), srv_rerror_rate(0), srv_diff_host_rate(0), service(http).
class(dos) :- flag(s0), logged_in(0), root_shell(0), srv_serror_rate(100000), rerror_rate(0), srv_rerror_rate(0), srv_diff_host_rate(0).
class(dos) :- logged_in(0), srv_diff_host_rate(0), service(nnsp).
class(dos) :- logged_in(0), srv_diff_host_rate(0), service(z39_50).
class(probe) :- root_shell(0), srv_serror_rate(0), rerror_rate(92000).
class(dos) :- logged_in(0), root_shell(0), srv_diff_host_rate(0), service(ldap).
class(dos) :- logged_in(0), root_shell(0), srv_diff_host_rate(0), service(csnet_ns).
class(probe) :- logged_in(0), srv_diff_host_rate(0), srv_serror_rate(0), srv_rerror_rate(100000), service(other).
class(probe) :- logged_in(0), root_shell(0), serror_rate(100000), srv_serror_rate(100000), rerror_rate(0), srv_rerror_rate(0), flag(sh).
class(dos) :- flag(s0), logged_in(0), srv_serror_rate(100000), srv_rerror_rate(0), srv_diff_host_rate(0), service(ftp_data).
class(probe) :- logged_in(0), root_shell(0), rerror_rate(90000).
class(dos) :- logged_in(0), root_shell(0), srv_diff_host_rate(0), service(kshell).
class(dos) :- logged_in(0), root_shell(0), srv_diff_host_rate(0), service(courier).
class(dos) :- flag(s0), logged_in(0), root_shell(0), srv_serror_rate(100000), srv_rerror_rate(0), srv_diff_host_rate(0), service(finger).
class(dos) :- root_shell(0), service(http), logged_in(1), serror_rate(0), srv_serror_rate(0), rerror_rate(33000).
class(dos) :- logged_in(0), srv_serror_rate(100000), srv_diff_host_rate(0), serror_rate(99000).
class(dos) :- logged_in(0), root_shell(0), srv_diff_host_rate(0), service(efs).
class(dos) :- logged_in(0), root_shell(0), srv_diff_host_rate(0), service(imap4).
class(dos) :- logged_in(0), serror_rate(0), rerror_rate(100000), srv_rerror_rate(100000), flag(rsto).
class(dos) :- service(private), logged_in(0), serror_rate(0), srv_serror_rate(0), flag(rej), rerror_rate(100000), srv_rerror_rate(100000).
class(probe) :- service(private), logged_in(0), srv_diff_host_rate(0), serror_rate(0), srv_serror_rate(0), srv_rerror_rate(100000), flag(rstr).
class(probe) :- logged_in(0), flag(rej), srv_rerror_rate(100000), serror_rate(7000).
class(dos) :- flag(s0), logged_in(0), serror_rate(100000).
class(dos) :- logged_in(0), srv_diff_host_rate(0), service(iso_tsap).
class(dos) :- logged_in(0), root_shell(0), srv_diff_host_rate(0), service(name).
class(dos) :- logged_in(0), root_shell(0), srv_diff_host_rate(0), service(ctf).
class(dos) :- logged_in(0), root_shell(0), srv_diff_host_rate(0), service(link).
class(dos) :- logged_in(0), srv_diff_host_rate(0), serror_rate(0), flag(rej), rerror_rate(100000), srv_rerror_rate(100000), service(whois).
class(dos) :- logged_in(0), srv_diff_host_rate(0), service(systat).
class(dos) :- logged_in(0), root_shell(0), srv_diff_host_rate(0), service(hostnames).
class(dos) :- logged_in(0), root_shell(0), srv_diff_host_rate(0), service(http_443).
class(probe) :- service(private), logged_in(0), srv_diff_host_rate(0), srv_serror_rate(0), srv_rerror_rate(100000), rerror_rate(50000).
class(dos) :- logged_in(0), srv_diff_host_rate(0), service(netbios_ssn).
class(dos) :- logged_in(0), root_shell(0), srv_diff_host_rate(0), service(netstat).
class(dos) :- logged_in(0), srv_diff_host_rate(0), service(ssh).
class(probe) :- service(private), logged_in(0), srv_diff_host_rate(0), srv_serror_rate(0), flag(rej), srv_rerror_rate(100000), rerror_rate(95000).
class(probe) :- service(private), logged_in(0), srv_diff_host_rate(0), srv_serror_rate(0), flag(rej), srv_rerror_rate(100000), serror_rate(1000).
class(dos) :- logged_in(0), srv_diff_host_rate(0), service(sql_net).
class(dos) :- root_shell(0), srv_rerror_rate(17000).
class(dos) :- logged_in(0), root_shell(0), srv_diff_host_rate(0), service(vmnet).
class(probe) :- logged_in(0), srv_serror_rate(0), flag(rej), srv_rerror_rate(100000), serror_rate(11000).
class(dos) :- logged_in(0), srv_diff_host_rate(0), serror_rate(0), srv_serror_rate(0), flag(rej), rerror_rate(100000), srv_rerror_rate(100000), service(ftp_data).
class(dos) :- logged_in(0), srv_diff_host_rate(0), service(netbios_dgm).
class(dos) :- root_shell(0), service(http), flag(sf), logged_in(1), srv_rerror_rate(20000).
class(dos) :- service(http), logged_in(1), serror_rate(0), srv_serror_rate(0), rerror_rate(25000).
class(dos) :- logged_in(0), srv_diff_host_rate(0), serror_rate(0), flag(rej), rerror_rate(100000), srv_rerror_rate(100000), service(gopher).
class(probe) :- service(private), logged_in(0), srv_diff_host_rate(0), srv_serror_rate(0), flag(rej), srv_rerror_rate(100000), rerror_rate(93000).
class(dos) :- logged_in(0), srv_diff_host_rate(0), service(mtp).
class(dos) :- logged_in(0), srv_diff_host_rate(0), serror_rate(0), srv_serror_rate(0), flag(rej), rerror_rate(100000), srv_rerror_rate(100000), service(domain).
class(dos) :- logged_in(0), srv_diff_host_rate(0), service(netbios_ns).
class(dos) :- flag(s0), logged_in(0), srv_serror_rate(100000), srv_diff_host_rate(0), service(telnet).
class(dos) :- logged_in(0), srv_diff_host_rate(0), service(bgp).
class(dos) :- logged_in(0), root_shell(0), srv_diff_host_rate(0), service(klogin).
class(probe) :- logged_in(0), root_shell(0), srv_diff_host_rate(0), flag(rstos0).
class(dos) :- logged_in(0), srv_diff_host_rate(0), serror_rate(0), flag(rej), rerror_rate(100000), srv_rerror_rate(100000), service(supdup).
class(dos) :- service(http), logged_in(1), flag(rstr).
class(dos) :- logged_in(0), srv_diff_host_rate(0), serror_rate(0), flag(rej), rerror_rate(100000), srv_rerror_rate(100000), service(auth).
class(probe) :- srv_serror_rate(0), serror_rate(3000).
class(probe) :- logged_in(0), root_shell(0), serror_rate(20000), rerror_rate(80000).
class(probe) :- service(private), logged_in(0), rerror_rate(0), srv_rerror_rate(0), srv_diff_host_rate(0), flag(oth).
class(dos) :- logged_in(0), srv_diff_host_rate(0), service(uucp_path).