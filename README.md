# Various-Attack-Scenario-Generation

## Benign Workload Generator Manual

Three Benign Tools:
- httperf
- stress-ng
- xdisk

### httperf

#### Installation

```shell
sudo apt install httperf
```

#### Manual

<details>
  <summary>Click to expand!</summary>
    
  Usage: httperf [-hdvV] [--add-header S] [--burst-length N] [--client N/N]  
        [--close-with-reset] [--debug N] [--failure-status N]  
        [--help] [--hog] [--http-version S] [--max-connections N]  
        [--max-piped-calls N] [--method S] [--no-host-hdr]  
        [--num-calls N] [--num-conns N] [--session-cookies]  
        [--period [d|u|e]T1[,T2]|[v]T1,D1[,T2,D2]...[,Tn,Dn]]  
        [--print-reply [header|body]] [--print-request [header|body]]  
        [--rate X] [--recv-buffer N] [--retry-on-failure] [--send-buffer N]  
        [--server S|--servers file] [--server-name S] [--port N] [--uri S] [--myaddr S]  
        [--think-timeout X] [--timeout X] [--verbose] [--version]  
        [--wlog y|n,file] [--wsess N,N,X] [--wsesslog N,X,file]  
        [--wset N,X]  
        [--runtime X]  
        [--use-timer-cache]  
        [--periodic-stats]  
    
</details>

### stress-ng

#### Installation

```shell
sudo apt install stress-ng
```

#### Manual

[link](https://manpages.ubuntu.com/manpages/jammy/man1/stress-ng.1.html)