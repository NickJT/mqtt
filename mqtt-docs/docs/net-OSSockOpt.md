# OSSockOpt
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-4)</span>

Convenience functions to fetch the option level and option
name constants (arguments #2 and #3) for the
`getsockopt(2)` and `setsockopt(2)` operating system calls.

The values of the option level and option name constants are
typically C preprocessor macros, e.g., `#define SOMETHING 42`.
These macro names are upper case and may contain multiple
consecutive underscore characters (though this is rare, for
example, `IP_NAT__XXX`).  The function names in this primitive
are derived by the C macro name and then:

  * converted to lower case
  * any double underscore (`__`) is converted to a
    single underscore (`_`).

These constants are _not_ stable between Pony releases.
Values returned by this function may be held by long-lived variables
by the calling process: values cannot change while the process runs.
Programmers must not cache any of these values for purposes of
sharing them for use by any other Pony program (for example,
sharing via serialization & deserialization or via direct
shared memory).

Many functions may return `-1`, which means that the constant's
value could not be determined at the Pony runtime library compile
time.  One cause may be that the option truly isn't available,
for example, the option level constant `IPPROTO_3PC` is available
on MacOS 10.x but not on Linux 4.4.  Another cause may be the
Pony runtime library's compilation did not include the correct
header file(s) for the target OS platform.

A third cause of error is due to the regular expression-based
approach used to harvest desirable constants.  It is not fool-proof.
The regexp used is too broad and finds some macros that are not
supposed to be used with `getsockopt(2)` and `setsockopt(2)`.
Please consult your platform's documentation to verify the names
of the option level and option name macros.

The following code fragments are equivalent: set the socket
receive buffer size for the file descriptor `fd` to `4455`.

```c
/* In C */
int option_value = 4455;
setsockopt(fd, SOL_SOCKET, SO_RCVBUF, &option_value, 4);

/* In Pony */
var option: I32 = 4455;
@setsockopt[I32](fd, OSSockOpt.sol_socket(), OSSockOpt.so_rcvbuf(),
  addressof option, I32(4))
```


```pony
primitive val OSSockOpt
```

## Constructors

### create
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-4)</span>


```pony
new val create()
: OSSockOpt val^
```

#### Returns

* [OSSockOpt](net-OSSockOpt.md) val^

---

## Public Functions

### ipproto_3pc
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-76)</span>


```pony
fun box ipproto_3pc()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_adfs
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-77)</span>


```pony
fun box ipproto_adfs()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_ah
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-78)</span>


```pony
fun box ipproto_ah()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_ahip
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-79)</span>


```pony
fun box ipproto_ahip()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_apes
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-80)</span>


```pony
fun box ipproto_apes()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_argus
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-81)</span>


```pony
fun box ipproto_argus()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_ax25
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-82)</span>


```pony
fun box ipproto_ax25()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_beetph
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-83)</span>


```pony
fun box ipproto_beetph()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_bha
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-84)</span>


```pony
fun box ipproto_bha()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_blt
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-85)</span>


```pony
fun box ipproto_blt()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_brsatmon
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-86)</span>


```pony
fun box ipproto_brsatmon()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_carp
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-87)</span>


```pony
fun box ipproto_carp()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_cftp
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-88)</span>


```pony
fun box ipproto_cftp()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_chaos
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-89)</span>


```pony
fun box ipproto_chaos()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_cmtp
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-90)</span>


```pony
fun box ipproto_cmtp()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_comp
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-91)</span>


```pony
fun box ipproto_comp()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_cphb
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-92)</span>


```pony
fun box ipproto_cphb()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_cpnx
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-93)</span>


```pony
fun box ipproto_cpnx()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_dccp
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-94)</span>


```pony
fun box ipproto_dccp()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_ddp
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-95)</span>


```pony
fun box ipproto_ddp()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_dgp
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-96)</span>


```pony
fun box ipproto_dgp()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_divert
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-97)</span>


```pony
fun box ipproto_divert()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_done
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-98)</span>


```pony
fun box ipproto_done()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_dstopts
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-99)</span>


```pony
fun box ipproto_dstopts()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_egp
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-100)</span>


```pony
fun box ipproto_egp()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_emcon
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-101)</span>


```pony
fun box ipproto_emcon()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_encap
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-102)</span>


```pony
fun box ipproto_encap()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_eon
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-103)</span>


```pony
fun box ipproto_eon()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_esp
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-104)</span>


```pony
fun box ipproto_esp()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_etherip
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-105)</span>


```pony
fun box ipproto_etherip()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_fragment
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-106)</span>


```pony
fun box ipproto_fragment()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_ggp
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-107)</span>


```pony
fun box ipproto_ggp()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_gmtp
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-108)</span>


```pony
fun box ipproto_gmtp()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_gre
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-109)</span>


```pony
fun box ipproto_gre()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_hello
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-110)</span>


```pony
fun box ipproto_hello()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_hip
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-111)</span>


```pony
fun box ipproto_hip()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_hmp
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-112)</span>


```pony
fun box ipproto_hmp()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_hopopts
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-113)</span>


```pony
fun box ipproto_hopopts()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_icmp
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-114)</span>


```pony
fun box ipproto_icmp()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_icmpv6
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-115)</span>


```pony
fun box ipproto_icmpv6()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_idp
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-116)</span>


```pony
fun box ipproto_idp()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_idpr
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-117)</span>


```pony
fun box ipproto_idpr()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_idrp
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-118)</span>


```pony
fun box ipproto_idrp()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_igmp
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-119)</span>


```pony
fun box ipproto_igmp()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_igp
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-120)</span>


```pony
fun box ipproto_igp()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_igrp
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-121)</span>


```pony
fun box ipproto_igrp()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_il
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-122)</span>


```pony
fun box ipproto_il()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_inlsp
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-123)</span>


```pony
fun box ipproto_inlsp()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_inp
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-124)</span>


```pony
fun box ipproto_inp()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_ip
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-125)</span>


```pony
fun box ipproto_ip()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_ipcomp
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-126)</span>


```pony
fun box ipproto_ipcomp()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_ipcv
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-127)</span>


```pony
fun box ipproto_ipcv()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_ipeip
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-128)</span>


```pony
fun box ipproto_ipeip()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_ipip
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-129)</span>


```pony
fun box ipproto_ipip()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_ippc
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-130)</span>


```pony
fun box ipproto_ippc()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_ipv4
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-131)</span>


```pony
fun box ipproto_ipv4()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_ipv6
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-132)</span>


```pony
fun box ipproto_ipv6()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_irtp
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-133)</span>


```pony
fun box ipproto_irtp()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_kryptolan
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-134)</span>


```pony
fun box ipproto_kryptolan()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_larp
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-135)</span>


```pony
fun box ipproto_larp()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_leaf1
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-136)</span>


```pony
fun box ipproto_leaf1()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_leaf2
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-137)</span>


```pony
fun box ipproto_leaf2()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_max
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-138)</span>


```pony
fun box ipproto_max()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_maxid
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-139)</span>


```pony
fun box ipproto_maxid()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_meas
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-140)</span>


```pony
fun box ipproto_meas()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_mh
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-141)</span>


```pony
fun box ipproto_mh()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_mhrp
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-142)</span>


```pony
fun box ipproto_mhrp()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_micp
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-143)</span>


```pony
fun box ipproto_micp()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_mobile
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-144)</span>


```pony
fun box ipproto_mobile()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_mpls
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-145)</span>


```pony
fun box ipproto_mpls()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_mtp
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-146)</span>


```pony
fun box ipproto_mtp()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_mux
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-147)</span>


```pony
fun box ipproto_mux()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_nd
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-148)</span>


```pony
fun box ipproto_nd()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_nhrp
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-149)</span>


```pony
fun box ipproto_nhrp()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_none
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-150)</span>


```pony
fun box ipproto_none()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_nsp
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-151)</span>


```pony
fun box ipproto_nsp()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_nvpii
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-152)</span>


```pony
fun box ipproto_nvpii()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_old_divert
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-153)</span>


```pony
fun box ipproto_old_divert()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_ospfigp
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-154)</span>


```pony
fun box ipproto_ospfigp()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_pfsync
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-155)</span>


```pony
fun box ipproto_pfsync()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_pgm
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-156)</span>


```pony
fun box ipproto_pgm()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_pigp
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-157)</span>


```pony
fun box ipproto_pigp()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_pim
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-158)</span>


```pony
fun box ipproto_pim()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_prm
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-159)</span>


```pony
fun box ipproto_prm()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_pup
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-160)</span>


```pony
fun box ipproto_pup()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_pvp
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-161)</span>


```pony
fun box ipproto_pvp()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_raw
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-162)</span>


```pony
fun box ipproto_raw()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_rccmon
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-163)</span>


```pony
fun box ipproto_rccmon()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_rdp
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-164)</span>


```pony
fun box ipproto_rdp()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_reserved_253
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-165)</span>


```pony
fun box ipproto_reserved_253()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_reserved_254
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-166)</span>


```pony
fun box ipproto_reserved_254()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_routing
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-167)</span>


```pony
fun box ipproto_routing()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_rsvp
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-168)</span>


```pony
fun box ipproto_rsvp()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_rvd
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-169)</span>


```pony
fun box ipproto_rvd()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_satexpak
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-170)</span>


```pony
fun box ipproto_satexpak()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_satmon
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-171)</span>


```pony
fun box ipproto_satmon()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_sccsp
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-172)</span>


```pony
fun box ipproto_sccsp()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_sctp
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-173)</span>


```pony
fun box ipproto_sctp()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_sdrp
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-174)</span>


```pony
fun box ipproto_sdrp()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_send
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-175)</span>


```pony
fun box ipproto_send()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_sep
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-176)</span>


```pony
fun box ipproto_sep()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_shim6
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-177)</span>


```pony
fun box ipproto_shim6()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_skip
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-178)</span>


```pony
fun box ipproto_skip()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_spacer
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-179)</span>


```pony
fun box ipproto_spacer()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_srpc
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-180)</span>


```pony
fun box ipproto_srpc()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_st
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-181)</span>


```pony
fun box ipproto_st()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_svmtp
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-182)</span>


```pony
fun box ipproto_svmtp()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_swipe
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-183)</span>


```pony
fun box ipproto_swipe()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_tcf
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-184)</span>


```pony
fun box ipproto_tcf()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_tcp
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-185)</span>


```pony
fun box ipproto_tcp()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_tlsp
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-186)</span>


```pony
fun box ipproto_tlsp()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_tp
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-187)</span>


```pony
fun box ipproto_tp()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_tpxx
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-188)</span>


```pony
fun box ipproto_tpxx()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_trunk1
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-189)</span>


```pony
fun box ipproto_trunk1()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_trunk2
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-190)</span>


```pony
fun box ipproto_trunk2()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_ttp
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-191)</span>


```pony
fun box ipproto_ttp()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_udp
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-192)</span>


```pony
fun box ipproto_udp()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_udplite
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-193)</span>


```pony
fun box ipproto_udplite()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_vines
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-194)</span>


```pony
fun box ipproto_vines()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_visa
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-195)</span>


```pony
fun box ipproto_visa()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_vmtp
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-196)</span>


```pony
fun box ipproto_vmtp()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_wbexpak
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-197)</span>


```pony
fun box ipproto_wbexpak()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_wbmon
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-198)</span>


```pony
fun box ipproto_wbmon()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_wsn
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-199)</span>


```pony
fun box ipproto_wsn()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_xnet
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-200)</span>


```pony
fun box ipproto_xnet()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipproto_xtp
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-201)</span>


```pony
fun box ipproto_xtp()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sol_atalk
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-202)</span>


```pony
fun box sol_atalk()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sol_ax25
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-203)</span>


```pony
fun box sol_ax25()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sol_hci_raw
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-204)</span>


```pony
fun box sol_hci_raw()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sol_ipx
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-205)</span>


```pony
fun box sol_ipx()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sol_l2cap
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-206)</span>


```pony
fun box sol_l2cap()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sol_local
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-207)</span>


```pony
fun box sol_local()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sol_ndrvproto
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-208)</span>


```pony
fun box sol_ndrvproto()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sol_netrom
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-209)</span>


```pony
fun box sol_netrom()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sol_rds
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-210)</span>


```pony
fun box sol_rds()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sol_rfcomm
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-211)</span>


```pony
fun box sol_rfcomm()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sol_rose
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-212)</span>


```pony
fun box sol_rose()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sol_sco
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-213)</span>


```pony
fun box sol_sco()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sol_socket
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-214)</span>


```pony
fun box sol_socket()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sol_tipc
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-215)</span>


```pony
fun box sol_tipc()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sol_udp
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-216)</span>


```pony
fun box sol_udp()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### af_coip
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-225)</span>


```pony
fun box af_coip()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### af_inet
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-226)</span>


```pony
fun box af_inet()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### af_inet6
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-227)</span>


```pony
fun box af_inet6()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### bluetooth_proto_sco
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-228)</span>


```pony
fun box bluetooth_proto_sco()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### dccp_nr_pkt_types
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-229)</span>


```pony
fun box dccp_nr_pkt_types()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### dccp_service_list_max_len
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-230)</span>


```pony
fun box dccp_service_list_max_len()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### dccp_single_opt_maxlen
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-231)</span>


```pony
fun box dccp_single_opt_maxlen()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### dccp_sockopt_available_ccids
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-232)</span>


```pony
fun box dccp_sockopt_available_ccids()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### dccp_sockopt_ccid
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-233)</span>


```pony
fun box dccp_sockopt_ccid()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### dccp_sockopt_ccid_rx_info
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-234)</span>


```pony
fun box dccp_sockopt_ccid_rx_info()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### dccp_sockopt_ccid_tx_info
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-235)</span>


```pony
fun box dccp_sockopt_ccid_tx_info()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### dccp_sockopt_change_l
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-236)</span>


```pony
fun box dccp_sockopt_change_l()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### dccp_sockopt_change_r
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-237)</span>


```pony
fun box dccp_sockopt_change_r()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### dccp_sockopt_get_cur_mps
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-238)</span>


```pony
fun box dccp_sockopt_get_cur_mps()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### dccp_sockopt_packet_size
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-239)</span>


```pony
fun box dccp_sockopt_packet_size()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### dccp_sockopt_qpolicy_id
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-240)</span>


```pony
fun box dccp_sockopt_qpolicy_id()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### dccp_sockopt_qpolicy_txqlen
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-241)</span>


```pony
fun box dccp_sockopt_qpolicy_txqlen()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### dccp_sockopt_recv_cscov
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-242)</span>


```pony
fun box dccp_sockopt_recv_cscov()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### dccp_sockopt_rx_ccid
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-243)</span>


```pony
fun box dccp_sockopt_rx_ccid()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### dccp_sockopt_send_cscov
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-244)</span>


```pony
fun box dccp_sockopt_send_cscov()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### dccp_sockopt_server_timewait
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-245)</span>


```pony
fun box dccp_sockopt_server_timewait()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### dccp_sockopt_service
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-246)</span>


```pony
fun box dccp_sockopt_service()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### dccp_sockopt_tx_ccid
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-247)</span>


```pony
fun box dccp_sockopt_tx_ccid()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### dso_acceptmode
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-248)</span>


```pony
fun box dso_acceptmode()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### dso_conaccept
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-249)</span>


```pony
fun box dso_conaccept()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### dso_conaccess
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-250)</span>


```pony
fun box dso_conaccess()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### dso_condata
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-251)</span>


```pony
fun box dso_condata()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### dso_conreject
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-252)</span>


```pony
fun box dso_conreject()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### dso_cork
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-253)</span>


```pony
fun box dso_cork()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### dso_disdata
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-254)</span>


```pony
fun box dso_disdata()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### dso_info
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-255)</span>


```pony
fun box dso_info()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### dso_linkinfo
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-256)</span>


```pony
fun box dso_linkinfo()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### dso_max
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-257)</span>


```pony
fun box dso_max()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### dso_maxwindow
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-258)</span>


```pony
fun box dso_maxwindow()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### dso_nodelay
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-259)</span>


```pony
fun box dso_nodelay()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### dso_seqpacket
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-260)</span>


```pony
fun box dso_seqpacket()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### dso_services
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-261)</span>


```pony
fun box dso_services()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### dso_stream
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-262)</span>


```pony
fun box dso_stream()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### icmp_address
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-263)</span>


```pony
fun box icmp_address()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### icmp_addressreply
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-264)</span>


```pony
fun box icmp_addressreply()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### icmp_dest_unreach
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-265)</span>


```pony
fun box icmp_dest_unreach()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### icmp_echo
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-266)</span>


```pony
fun box icmp_echo()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### icmp_echoreply
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-267)</span>


```pony
fun box icmp_echoreply()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### icmp_exc_fragtime
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-268)</span>


```pony
fun box icmp_exc_fragtime()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### icmp_exc_ttl
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-269)</span>


```pony
fun box icmp_exc_ttl()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### icmp_filter
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-270)</span>


```pony
fun box icmp_filter()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### icmp_frag_needed
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-271)</span>


```pony
fun box icmp_frag_needed()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### icmp_host_ano
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-272)</span>


```pony
fun box icmp_host_ano()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### icmp_host_isolated
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-273)</span>


```pony
fun box icmp_host_isolated()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### icmp_host_unknown
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-274)</span>


```pony
fun box icmp_host_unknown()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### icmp_host_unreach
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-275)</span>


```pony
fun box icmp_host_unreach()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### icmp_host_unr_tos
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-276)</span>


```pony
fun box icmp_host_unr_tos()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### icmp_info_reply
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-277)</span>


```pony
fun box icmp_info_reply()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### icmp_info_request
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-278)</span>


```pony
fun box icmp_info_request()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### icmp_net_ano
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-279)</span>


```pony
fun box icmp_net_ano()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### icmp_net_unknown
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-280)</span>


```pony
fun box icmp_net_unknown()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### icmp_net_unreach
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-281)</span>


```pony
fun box icmp_net_unreach()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### icmp_net_unr_tos
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-282)</span>


```pony
fun box icmp_net_unr_tos()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### icmp_parameterprob
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-283)</span>


```pony
fun box icmp_parameterprob()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### icmp_pkt_filtered
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-284)</span>


```pony
fun box icmp_pkt_filtered()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### icmp_port_unreach
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-285)</span>


```pony
fun box icmp_port_unreach()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### icmp_prec_cutoff
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-286)</span>


```pony
fun box icmp_prec_cutoff()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### icmp_prec_violation
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-287)</span>


```pony
fun box icmp_prec_violation()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### icmp_prot_unreach
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-288)</span>


```pony
fun box icmp_prot_unreach()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### icmp_redirect
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-289)</span>


```pony
fun box icmp_redirect()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### icmp_redir_host
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-290)</span>


```pony
fun box icmp_redir_host()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### icmp_redir_hosttos
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-291)</span>


```pony
fun box icmp_redir_hosttos()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### icmp_redir_net
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-292)</span>


```pony
fun box icmp_redir_net()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### icmp_redir_nettos
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-293)</span>


```pony
fun box icmp_redir_nettos()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### icmp_source_quench
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-294)</span>


```pony
fun box icmp_source_quench()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### icmp_sr_failed
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-295)</span>


```pony
fun box icmp_sr_failed()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### icmp_timestamp
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-296)</span>


```pony
fun box icmp_timestamp()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### icmp_timestampreply
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-297)</span>


```pony
fun box icmp_timestampreply()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### icmp_time_exceeded
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-298)</span>


```pony
fun box icmp_time_exceeded()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipctl_acceptsourceroute
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-299)</span>


```pony
fun box ipctl_acceptsourceroute()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipctl_defmtu
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-300)</span>


```pony
fun box ipctl_defmtu()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipctl_defttl
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-301)</span>


```pony
fun box ipctl_defttl()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipctl_directedbroadcast
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-302)</span>


```pony
fun box ipctl_directedbroadcast()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipctl_fastforwarding
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-303)</span>


```pony
fun box ipctl_fastforwarding()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipctl_forwarding
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-304)</span>


```pony
fun box ipctl_forwarding()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipctl_gif_ttl
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-305)</span>


```pony
fun box ipctl_gif_ttl()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipctl_intrdqdrops
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-306)</span>


```pony
fun box ipctl_intrdqdrops()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipctl_intrdqmaxlen
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-307)</span>


```pony
fun box ipctl_intrdqmaxlen()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipctl_intrqdrops
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-308)</span>


```pony
fun box ipctl_intrqdrops()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipctl_intrqmaxlen
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-309)</span>


```pony
fun box ipctl_intrqmaxlen()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipctl_keepfaith
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-310)</span>


```pony
fun box ipctl_keepfaith()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipctl_maxid
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-311)</span>


```pony
fun box ipctl_maxid()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipctl_rtexpire
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-312)</span>


```pony
fun box ipctl_rtexpire()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipctl_rtmaxcache
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-313)</span>


```pony
fun box ipctl_rtmaxcache()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipctl_rtminexpire
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-314)</span>


```pony
fun box ipctl_rtminexpire()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipctl_sendredirects
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-315)</span>


```pony
fun box ipctl_sendredirects()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipctl_sourceroute
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-316)</span>


```pony
fun box ipctl_sourceroute()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipctl_stats
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-317)</span>


```pony
fun box ipctl_stats()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipport_ephemeralfirst
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-318)</span>


```pony
fun box ipport_ephemeralfirst()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipport_ephemerallast
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-319)</span>


```pony
fun box ipport_ephemerallast()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipport_hifirstauto
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-320)</span>


```pony
fun box ipport_hifirstauto()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipport_hilastauto
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-321)</span>


```pony
fun box ipport_hilastauto()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipport_max
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-322)</span>


```pony
fun box ipport_max()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipport_reserved
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-323)</span>


```pony
fun box ipport_reserved()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipport_reservedstart
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-324)</span>


```pony
fun box ipport_reservedstart()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipport_userreserved
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-325)</span>


```pony
fun box ipport_userreserved()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_2292dstopts
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-326)</span>


```pony
fun box ipv6_2292dstopts()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_2292hoplimit
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-327)</span>


```pony
fun box ipv6_2292hoplimit()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_2292hopopts
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-328)</span>


```pony
fun box ipv6_2292hopopts()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_2292pktinfo
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-329)</span>


```pony
fun box ipv6_2292pktinfo()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_2292pktoptions
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-330)</span>


```pony
fun box ipv6_2292pktoptions()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_2292rthdr
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-331)</span>


```pony
fun box ipv6_2292rthdr()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_addrform
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-332)</span>


```pony
fun box ipv6_addrform()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_addr_preferences
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-333)</span>


```pony
fun box ipv6_addr_preferences()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_add_membership
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-334)</span>


```pony
fun box ipv6_add_membership()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_authhdr
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-335)</span>


```pony
fun box ipv6_authhdr()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_autoflowlabel
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-336)</span>


```pony
fun box ipv6_autoflowlabel()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_checksum
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-337)</span>


```pony
fun box ipv6_checksum()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_dontfrag
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-338)</span>


```pony
fun box ipv6_dontfrag()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_drop_membership
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-339)</span>


```pony
fun box ipv6_drop_membership()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_dstopts
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-340)</span>


```pony
fun box ipv6_dstopts()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_flowinfo
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-341)</span>


```pony
fun box ipv6_flowinfo()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_flowinfo_flowlabel
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-342)</span>


```pony
fun box ipv6_flowinfo_flowlabel()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_flowinfo_priority
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-343)</span>


```pony
fun box ipv6_flowinfo_priority()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_flowinfo_send
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-344)</span>


```pony
fun box ipv6_flowinfo_send()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_flowlabel_mgr
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-345)</span>


```pony
fun box ipv6_flowlabel_mgr()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_fl_a_get
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-346)</span>


```pony
fun box ipv6_fl_a_get()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_fl_a_put
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-347)</span>


```pony
fun box ipv6_fl_a_put()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_fl_a_renew
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-348)</span>


```pony
fun box ipv6_fl_a_renew()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_fl_f_create
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-349)</span>


```pony
fun box ipv6_fl_f_create()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_fl_f_excl
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-350)</span>


```pony
fun box ipv6_fl_f_excl()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_fl_f_reflect
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-351)</span>


```pony
fun box ipv6_fl_f_reflect()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_fl_f_remote
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-352)</span>


```pony
fun box ipv6_fl_f_remote()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_fl_s_any
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-353)</span>


```pony
fun box ipv6_fl_s_any()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_fl_s_excl
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-354)</span>


```pony
fun box ipv6_fl_s_excl()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_fl_s_none
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-355)</span>


```pony
fun box ipv6_fl_s_none()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_fl_s_process
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-356)</span>


```pony
fun box ipv6_fl_s_process()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_fl_s_user
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-357)</span>


```pony
fun box ipv6_fl_s_user()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_hoplimit
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-358)</span>


```pony
fun box ipv6_hoplimit()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_hopopts
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-359)</span>


```pony
fun box ipv6_hopopts()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_ipsec_policy
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-360)</span>


```pony
fun box ipv6_ipsec_policy()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_join_anycast
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-361)</span>


```pony
fun box ipv6_join_anycast()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_leave_anycast
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-362)</span>


```pony
fun box ipv6_leave_anycast()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_minhopcount
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-363)</span>


```pony
fun box ipv6_minhopcount()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_mtu
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-364)</span>


```pony
fun box ipv6_mtu()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_mtu_discover
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-365)</span>


```pony
fun box ipv6_mtu_discover()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_multicast_hops
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-366)</span>


```pony
fun box ipv6_multicast_hops()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_multicast_if
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-367)</span>


```pony
fun box ipv6_multicast_if()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_multicast_loop
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-368)</span>


```pony
fun box ipv6_multicast_loop()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_nexthop
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-369)</span>


```pony
fun box ipv6_nexthop()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_origdstaddr
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-370)</span>


```pony
fun box ipv6_origdstaddr()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_pathmtu
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-371)</span>


```pony
fun box ipv6_pathmtu()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_pktinfo
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-372)</span>


```pony
fun box ipv6_pktinfo()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_pmtudisc_do
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-373)</span>


```pony
fun box ipv6_pmtudisc_do()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_pmtudisc_dont
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-374)</span>


```pony
fun box ipv6_pmtudisc_dont()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_pmtudisc_interface
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-375)</span>


```pony
fun box ipv6_pmtudisc_interface()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_pmtudisc_omit
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-376)</span>


```pony
fun box ipv6_pmtudisc_omit()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_pmtudisc_probe
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-377)</span>


```pony
fun box ipv6_pmtudisc_probe()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_pmtudisc_want
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-378)</span>


```pony
fun box ipv6_pmtudisc_want()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_prefer_src_cga
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-379)</span>


```pony
fun box ipv6_prefer_src_cga()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_prefer_src_coa
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-380)</span>


```pony
fun box ipv6_prefer_src_coa()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_prefer_src_home
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-381)</span>


```pony
fun box ipv6_prefer_src_home()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_prefer_src_noncga
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-382)</span>


```pony
fun box ipv6_prefer_src_noncga()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_prefer_src_public
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-383)</span>


```pony
fun box ipv6_prefer_src_public()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_prefer_src_pubtmp_default
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-384)</span>


```pony
fun box ipv6_prefer_src_pubtmp_default()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_prefer_src_tmp
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-385)</span>


```pony
fun box ipv6_prefer_src_tmp()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_priority_10
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-386)</span>


```pony
fun box ipv6_priority_10()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_priority_11
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-387)</span>


```pony
fun box ipv6_priority_11()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_priority_12
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-388)</span>


```pony
fun box ipv6_priority_12()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_priority_13
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-389)</span>


```pony
fun box ipv6_priority_13()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_priority_14
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-390)</span>


```pony
fun box ipv6_priority_14()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_priority_15
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-391)</span>


```pony
fun box ipv6_priority_15()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_priority_8
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-392)</span>


```pony
fun box ipv6_priority_8()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_priority_9
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-393)</span>


```pony
fun box ipv6_priority_9()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_priority_bulk
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-394)</span>


```pony
fun box ipv6_priority_bulk()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_priority_control
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-395)</span>


```pony
fun box ipv6_priority_control()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_priority_filler
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-396)</span>


```pony
fun box ipv6_priority_filler()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_priority_interactive
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-397)</span>


```pony
fun box ipv6_priority_interactive()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_priority_reserved1
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-398)</span>


```pony
fun box ipv6_priority_reserved1()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_priority_reserved2
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-399)</span>


```pony
fun box ipv6_priority_reserved2()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_priority_unattended
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-400)</span>


```pony
fun box ipv6_priority_unattended()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_priority_uncharacterized
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-401)</span>


```pony
fun box ipv6_priority_uncharacterized()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_recvdstopts
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-402)</span>


```pony
fun box ipv6_recvdstopts()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_recverr
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-403)</span>


```pony
fun box ipv6_recverr()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_recvhoplimit
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-404)</span>


```pony
fun box ipv6_recvhoplimit()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_recvhopopts
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-405)</span>


```pony
fun box ipv6_recvhopopts()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_recvorigdstaddr
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-406)</span>


```pony
fun box ipv6_recvorigdstaddr()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_recvpathmtu
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-407)</span>


```pony
fun box ipv6_recvpathmtu()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_recvpktinfo
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-408)</span>


```pony
fun box ipv6_recvpktinfo()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_recvrthdr
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-409)</span>


```pony
fun box ipv6_recvrthdr()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_recvtclass
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-410)</span>


```pony
fun box ipv6_recvtclass()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_router_alert
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-411)</span>


```pony
fun box ipv6_router_alert()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_rthdr
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-412)</span>


```pony
fun box ipv6_rthdr()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_rthdrdstopts
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-413)</span>


```pony
fun box ipv6_rthdrdstopts()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_tclass
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-414)</span>


```pony
fun box ipv6_tclass()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_tlv_hao
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-415)</span>


```pony
fun box ipv6_tlv_hao()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_tlv_jumbo
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-416)</span>


```pony
fun box ipv6_tlv_jumbo()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_tlv_pad1
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-417)</span>


```pony
fun box ipv6_tlv_pad1()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_tlv_padn
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-418)</span>


```pony
fun box ipv6_tlv_padn()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_tlv_routeralert
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-419)</span>


```pony
fun box ipv6_tlv_routeralert()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_transparent
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-420)</span>


```pony
fun box ipv6_transparent()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_unicast_hops
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-421)</span>


```pony
fun box ipv6_unicast_hops()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_unicast_if
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-422)</span>


```pony
fun box ipv6_unicast_if()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_use_min_mtu
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-423)</span>


```pony
fun box ipv6_use_min_mtu()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_v6only
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-424)</span>


```pony
fun box ipv6_v6only()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipv6_xfrm_policy
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-425)</span>


```pony
fun box ipv6_xfrm_policy()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipx_address
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-426)</span>


```pony
fun box ipx_address()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipx_address_notify
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-427)</span>


```pony
fun box ipx_address_notify()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipx_crtitf
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-428)</span>


```pony
fun box ipx_crtitf()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipx_dltitf
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-429)</span>


```pony
fun box ipx_dltitf()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipx_dstype
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-430)</span>


```pony
fun box ipx_dstype()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipx_extended_address
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-431)</span>


```pony
fun box ipx_extended_address()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipx_filterptype
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-432)</span>


```pony
fun box ipx_filterptype()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipx_frame_8022
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-433)</span>


```pony
fun box ipx_frame_8022()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipx_frame_8023
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-434)</span>


```pony
fun box ipx_frame_8023()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipx_frame_etherii
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-435)</span>


```pony
fun box ipx_frame_etherii()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipx_frame_none
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-436)</span>


```pony
fun box ipx_frame_none()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipx_frame_snap
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-437)</span>


```pony
fun box ipx_frame_snap()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipx_frame_tr_8022
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-438)</span>


```pony
fun box ipx_frame_tr_8022()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipx_getnetinfo
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-439)</span>


```pony
fun box ipx_getnetinfo()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipx_getnetinfo_norip
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-440)</span>


```pony
fun box ipx_getnetinfo_norip()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipx_immediatespxack
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-441)</span>


```pony
fun box ipx_immediatespxack()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipx_internal
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-442)</span>


```pony
fun box ipx_internal()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipx_maxsize
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-443)</span>


```pony
fun box ipx_maxsize()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipx_max_adapter_num
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-444)</span>


```pony
fun box ipx_max_adapter_num()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipx_mtu
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-445)</span>


```pony
fun box ipx_mtu()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipx_node_len
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-446)</span>


```pony
fun box ipx_node_len()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipx_primary
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-447)</span>


```pony
fun box ipx_primary()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipx_ptype
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-448)</span>


```pony
fun box ipx_ptype()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipx_receive_broadcast
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-449)</span>


```pony
fun box ipx_receive_broadcast()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipx_recvhdr
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-450)</span>


```pony
fun box ipx_recvhdr()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipx_reripnetnumber
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-451)</span>


```pony
fun box ipx_reripnetnumber()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipx_route_no_router
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-452)</span>


```pony
fun box ipx_route_no_router()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipx_rt_8022
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-453)</span>


```pony
fun box ipx_rt_8022()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipx_rt_bluebook
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-454)</span>


```pony
fun box ipx_rt_bluebook()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipx_rt_routed
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-455)</span>


```pony
fun box ipx_rt_routed()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipx_rt_snap
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-456)</span>


```pony
fun box ipx_rt_snap()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipx_special_none
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-457)</span>


```pony
fun box ipx_special_none()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipx_spxgetconnectionstatus
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-458)</span>


```pony
fun box ipx_spxgetconnectionstatus()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipx_stopfilterptype
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-459)</span>


```pony
fun box ipx_stopfilterptype()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ipx_type
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-460)</span>


```pony
fun box ipx_type()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_add_membership
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-461)</span>


```pony
fun box ip_add_membership()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_add_source_membership
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-462)</span>


```pony
fun box ip_add_source_membership()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_bindany
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-463)</span>


```pony
fun box ip_bindany()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_bindmulti
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-464)</span>


```pony
fun box ip_bindmulti()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_bind_address_no_port
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-465)</span>


```pony
fun box ip_bind_address_no_port()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_block_source
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-466)</span>


```pony
fun box ip_block_source()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_bound_if
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-467)</span>


```pony
fun box ip_bound_if()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_checksum
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-468)</span>


```pony
fun box ip_checksum()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_default_multicast_loop
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-469)</span>


```pony
fun box ip_default_multicast_loop()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_default_multicast_ttl
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-470)</span>


```pony
fun box ip_default_multicast_ttl()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_dontfrag
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-471)</span>


```pony
fun box ip_dontfrag()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_drop_membership
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-472)</span>


```pony
fun box ip_drop_membership()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_drop_source_membership
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-473)</span>


```pony
fun box ip_drop_source_membership()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_dummynet3
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-474)</span>


```pony
fun box ip_dummynet3()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_dummynet_configure
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-475)</span>


```pony
fun box ip_dummynet_configure()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_dummynet_del
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-476)</span>


```pony
fun box ip_dummynet_del()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_dummynet_flush
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-477)</span>


```pony
fun box ip_dummynet_flush()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_dummynet_get
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-478)</span>


```pony
fun box ip_dummynet_get()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_faith
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-479)</span>


```pony
fun box ip_faith()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_flowid
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-480)</span>


```pony
fun box ip_flowid()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_flowtype
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-481)</span>


```pony
fun box ip_flowtype()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_freebind
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-482)</span>


```pony
fun box ip_freebind()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_fw3
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-483)</span>


```pony
fun box ip_fw3()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_fw_add
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-484)</span>


```pony
fun box ip_fw_add()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_fw_del
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-485)</span>


```pony
fun box ip_fw_del()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_fw_flush
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-486)</span>


```pony
fun box ip_fw_flush()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_fw_get
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-487)</span>


```pony
fun box ip_fw_get()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_fw_nat_cfg
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-488)</span>


```pony
fun box ip_fw_nat_cfg()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_fw_nat_del
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-489)</span>


```pony
fun box ip_fw_nat_del()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_fw_nat_get_config
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-490)</span>


```pony
fun box ip_fw_nat_get_config()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_fw_nat_get_log
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-491)</span>


```pony
fun box ip_fw_nat_get_log()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_fw_resetlog
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-492)</span>


```pony
fun box ip_fw_resetlog()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_fw_table_add
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-493)</span>


```pony
fun box ip_fw_table_add()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_fw_table_del
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-494)</span>


```pony
fun box ip_fw_table_del()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_fw_table_flush
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-495)</span>


```pony
fun box ip_fw_table_flush()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_fw_table_getsize
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-496)</span>


```pony
fun box ip_fw_table_getsize()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_fw_table_list
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-497)</span>


```pony
fun box ip_fw_table_list()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_fw_zero
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-498)</span>


```pony
fun box ip_fw_zero()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_hdrincl
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-499)</span>


```pony
fun box ip_hdrincl()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_ipsec_policy
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-500)</span>


```pony
fun box ip_ipsec_policy()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_max_group_src_filter
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-501)</span>


```pony
fun box ip_max_group_src_filter()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_max_memberships
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-502)</span>


```pony
fun box ip_max_memberships()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_max_sock_mute_filter
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-503)</span>


```pony
fun box ip_max_sock_mute_filter()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_max_sock_src_filter
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-504)</span>


```pony
fun box ip_max_sock_src_filter()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_max_source_filter
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-505)</span>


```pony
fun box ip_max_source_filter()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_minttl
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-506)</span>


```pony
fun box ip_minttl()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_min_memberships
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-507)</span>


```pony
fun box ip_min_memberships()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_msfilter
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-508)</span>


```pony
fun box ip_msfilter()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_mtu
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-509)</span>


```pony
fun box ip_mtu()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_mtu_discover
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-510)</span>


```pony
fun box ip_mtu_discover()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_multicast_all
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-511)</span>


```pony
fun box ip_multicast_all()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_multicast_if
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-512)</span>


```pony
fun box ip_multicast_if()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_multicast_ifindex
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-513)</span>


```pony
fun box ip_multicast_ifindex()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_multicast_loop
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-514)</span>


```pony
fun box ip_multicast_loop()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_multicast_ttl
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-515)</span>


```pony
fun box ip_multicast_ttl()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_multicast_vif
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-516)</span>


```pony
fun box ip_multicast_vif()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_nat_xxx
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-517)</span>


```pony
fun box ip_nat_xxx()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_nodefrag
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-518)</span>


```pony
fun box ip_nodefrag()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_old_fw_add
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-519)</span>


```pony
fun box ip_old_fw_add()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_old_fw_del
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-520)</span>


```pony
fun box ip_old_fw_del()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_old_fw_flush
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-521)</span>


```pony
fun box ip_old_fw_flush()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_old_fw_get
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-522)</span>


```pony
fun box ip_old_fw_get()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_old_fw_resetlog
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-523)</span>


```pony
fun box ip_old_fw_resetlog()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_old_fw_zero
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-524)</span>


```pony
fun box ip_old_fw_zero()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_onesbcast
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-525)</span>


```pony
fun box ip_onesbcast()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_options
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-526)</span>


```pony
fun box ip_options()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_origdstaddr
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-527)</span>


```pony
fun box ip_origdstaddr()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_passsec
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-528)</span>


```pony
fun box ip_passsec()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_pktinfo
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-529)</span>


```pony
fun box ip_pktinfo()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_pktoptions
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-530)</span>


```pony
fun box ip_pktoptions()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_pmtudisc_do
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-531)</span>


```pony
fun box ip_pmtudisc_do()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_pmtudisc_dont
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-532)</span>


```pony
fun box ip_pmtudisc_dont()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_pmtudisc_interface
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-533)</span>


```pony
fun box ip_pmtudisc_interface()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_pmtudisc_omit
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-534)</span>


```pony
fun box ip_pmtudisc_omit()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_pmtudisc_probe
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-535)</span>


```pony
fun box ip_pmtudisc_probe()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_pmtudisc_want
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-536)</span>


```pony
fun box ip_pmtudisc_want()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_portrange
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-537)</span>


```pony
fun box ip_portrange()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_portrange_default
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-538)</span>


```pony
fun box ip_portrange_default()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_portrange_high
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-539)</span>


```pony
fun box ip_portrange_high()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_portrange_low
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-540)</span>


```pony
fun box ip_portrange_low()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_recvdstaddr
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-541)</span>


```pony
fun box ip_recvdstaddr()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_recverr
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-542)</span>


```pony
fun box ip_recverr()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_recvflowid
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-543)</span>


```pony
fun box ip_recvflowid()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_recvif
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-544)</span>


```pony
fun box ip_recvif()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_recvopts
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-545)</span>


```pony
fun box ip_recvopts()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_recvorigdstaddr
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-546)</span>


```pony
fun box ip_recvorigdstaddr()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_recvpktinfo
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-547)</span>


```pony
fun box ip_recvpktinfo()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_recvretopts
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-548)</span>


```pony
fun box ip_recvretopts()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_recvrssbucketid
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-549)</span>


```pony
fun box ip_recvrssbucketid()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_recvtos
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-550)</span>


```pony
fun box ip_recvtos()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_recvttl
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-551)</span>


```pony
fun box ip_recvttl()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_retopts
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-552)</span>


```pony
fun box ip_retopts()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_router_alert
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-553)</span>


```pony
fun box ip_router_alert()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_rssbucketid
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-554)</span>


```pony
fun box ip_rssbucketid()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_rss_listen_bucket
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-555)</span>


```pony
fun box ip_rss_listen_bucket()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_rsvp_off
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-556)</span>


```pony
fun box ip_rsvp_off()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_rsvp_on
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-557)</span>


```pony
fun box ip_rsvp_on()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_rsvp_vif_off
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-558)</span>


```pony
fun box ip_rsvp_vif_off()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_rsvp_vif_on
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-559)</span>


```pony
fun box ip_rsvp_vif_on()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_sendsrcaddr
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-560)</span>


```pony
fun box ip_sendsrcaddr()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_striphdr
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-561)</span>


```pony
fun box ip_striphdr()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_tos
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-562)</span>


```pony
fun box ip_tos()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_traffic_mgt_background
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-563)</span>


```pony
fun box ip_traffic_mgt_background()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_transparent
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-564)</span>


```pony
fun box ip_transparent()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_ttl
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-565)</span>


```pony
fun box ip_ttl()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_unblock_source
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-566)</span>


```pony
fun box ip_unblock_source()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_unicast_if
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-567)</span>


```pony
fun box ip_unicast_if()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ip_xfrm_policy
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-568)</span>


```pony
fun box ip_xfrm_policy()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### local_connwait
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-569)</span>


```pony
fun box local_connwait()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### local_creds
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-570)</span>


```pony
fun box local_creds()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### local_peercred
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-571)</span>


```pony
fun box local_peercred()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### local_peerepid
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-572)</span>


```pony
fun box local_peerepid()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### local_peereuuid
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-573)</span>


```pony
fun box local_peereuuid()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### local_peerpid
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-574)</span>


```pony
fun box local_peerpid()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### local_peeruuid
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-575)</span>


```pony
fun box local_peeruuid()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### local_vendor
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-576)</span>


```pony
fun box local_vendor()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### max_tcpoptlen
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-577)</span>


```pony
fun box max_tcpoptlen()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### mcast_block_source
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-578)</span>


```pony
fun box mcast_block_source()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### mcast_exclude
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-579)</span>


```pony
fun box mcast_exclude()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### mcast_include
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-580)</span>


```pony
fun box mcast_include()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### mcast_join_group
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-581)</span>


```pony
fun box mcast_join_group()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### mcast_join_source_group
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-582)</span>


```pony
fun box mcast_join_source_group()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### mcast_leave_group
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-583)</span>


```pony
fun box mcast_leave_group()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### mcast_leave_source_group
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-584)</span>


```pony
fun box mcast_leave_source_group()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### mcast_msfilter
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-585)</span>


```pony
fun box mcast_msfilter()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### mcast_unblock_source
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-586)</span>


```pony
fun box mcast_unblock_source()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### mcast_undefined
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-587)</span>


```pony
fun box mcast_undefined()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### mrt_add_bw_upcall
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-588)</span>


```pony
fun box mrt_add_bw_upcall()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### mrt_add_mfc
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-589)</span>


```pony
fun box mrt_add_mfc()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### mrt_add_vif
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-590)</span>


```pony
fun box mrt_add_vif()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### mrt_api_config
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-591)</span>


```pony
fun box mrt_api_config()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### mrt_api_flags_all
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-592)</span>


```pony
fun box mrt_api_flags_all()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### mrt_api_support
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-593)</span>


```pony
fun box mrt_api_support()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### mrt_assert
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-594)</span>


```pony
fun box mrt_assert()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### mrt_del_bw_upcall
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-595)</span>


```pony
fun box mrt_del_bw_upcall()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### mrt_del_mfc
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-596)</span>


```pony
fun box mrt_del_mfc()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### mrt_del_vif
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-597)</span>


```pony
fun box mrt_del_vif()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### mrt_done
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-598)</span>


```pony
fun box mrt_done()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### mrt_init
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-599)</span>


```pony
fun box mrt_init()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### mrt_mfc_bw_upcall
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-600)</span>


```pony
fun box mrt_mfc_bw_upcall()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### mrt_mfc_flags_all
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-601)</span>


```pony
fun box mrt_mfc_flags_all()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### mrt_mfc_flags_border_vif
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-602)</span>


```pony
fun box mrt_mfc_flags_border_vif()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### mrt_mfc_flags_disable_wrongvif
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-603)</span>


```pony
fun box mrt_mfc_flags_disable_wrongvif()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### mrt_mfc_rp
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-604)</span>


```pony
fun box mrt_mfc_rp()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### mrt_pim
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-605)</span>


```pony
fun box mrt_pim()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### mrt_version
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-606)</span>


```pony
fun box mrt_version()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### msg_notification
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-607)</span>


```pony
fun box msg_notification()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### msg_socallbck
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-608)</span>


```pony
fun box msg_socallbck()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ndrvproto_ndrv
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-609)</span>


```pony
fun box ndrvproto_ndrv()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ndrv_addmulticast
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-610)</span>


```pony
fun box ndrv_addmulticast()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ndrv_deldmxspec
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-611)</span>


```pony
fun box ndrv_deldmxspec()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ndrv_delmulticast
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-612)</span>


```pony
fun box ndrv_delmulticast()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ndrv_demuxtype_ethertype
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-613)</span>


```pony
fun box ndrv_demuxtype_ethertype()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ndrv_demuxtype_sap
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-614)</span>


```pony
fun box ndrv_demuxtype_sap()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ndrv_demuxtype_snap
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-615)</span>


```pony
fun box ndrv_demuxtype_snap()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ndrv_dmux_max_descr
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-616)</span>


```pony
fun box ndrv_dmux_max_descr()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ndrv_protocol_desc_vers
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-617)</span>


```pony
fun box ndrv_protocol_desc_vers()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ndrv_setdmxspec
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-618)</span>


```pony
fun box ndrv_setdmxspec()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### netlink_add_membership
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-619)</span>


```pony
fun box netlink_add_membership()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### netlink_audit
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-620)</span>


```pony
fun box netlink_audit()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### netlink_broadcast_error
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-621)</span>


```pony
fun box netlink_broadcast_error()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### netlink_cap_ack
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-622)</span>


```pony
fun box netlink_cap_ack()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### netlink_connector
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-623)</span>


```pony
fun box netlink_connector()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### netlink_crypto
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-624)</span>


```pony
fun box netlink_crypto()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### netlink_dnrtmsg
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-625)</span>


```pony
fun box netlink_dnrtmsg()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### netlink_drop_membership
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-626)</span>


```pony
fun box netlink_drop_membership()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### netlink_ecryptfs
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-627)</span>


```pony
fun box netlink_ecryptfs()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### netlink_fib_lookup
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-628)</span>


```pony
fun box netlink_fib_lookup()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### netlink_firewall
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-629)</span>


```pony
fun box netlink_firewall()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### netlink_generic
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-630)</span>


```pony
fun box netlink_generic()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### netlink_inet_diag
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-631)</span>


```pony
fun box netlink_inet_diag()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### netlink_ip6_fw
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-632)</span>


```pony
fun box netlink_ip6_fw()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### netlink_iscsi
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-633)</span>


```pony
fun box netlink_iscsi()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### netlink_kobject_uevent
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-634)</span>


```pony
fun box netlink_kobject_uevent()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### netlink_listen_all_nsid
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-635)</span>


```pony
fun box netlink_listen_all_nsid()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### netlink_list_memberships
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-636)</span>


```pony
fun box netlink_list_memberships()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### netlink_netfilter
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-637)</span>


```pony
fun box netlink_netfilter()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### netlink_nflog
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-638)</span>


```pony
fun box netlink_nflog()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### netlink_no_enobufs
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-639)</span>


```pony
fun box netlink_no_enobufs()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### netlink_pktinfo
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-640)</span>


```pony
fun box netlink_pktinfo()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### netlink_rdma
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-641)</span>


```pony
fun box netlink_rdma()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### netlink_route
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-642)</span>


```pony
fun box netlink_route()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### netlink_rx_ring
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-643)</span>


```pony
fun box netlink_rx_ring()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### netlink_scsitransport
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-644)</span>


```pony
fun box netlink_scsitransport()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### netlink_selinux
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-645)</span>


```pony
fun box netlink_selinux()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### netlink_sock_diag
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-646)</span>


```pony
fun box netlink_sock_diag()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### netlink_tx_ring
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-647)</span>


```pony
fun box netlink_tx_ring()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### netlink_unused
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-648)</span>


```pony
fun box netlink_unused()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### netlink_usersock
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-649)</span>


```pony
fun box netlink_usersock()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### netlink_xfrm
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-650)</span>


```pony
fun box netlink_xfrm()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### netrom_idle
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-651)</span>


```pony
fun box netrom_idle()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### netrom_kill
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-652)</span>


```pony
fun box netrom_kill()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### netrom_n2
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-653)</span>


```pony
fun box netrom_n2()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### netrom_neigh
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-654)</span>


```pony
fun box netrom_neigh()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### netrom_node
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-655)</span>


```pony
fun box netrom_node()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### netrom_paclen
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-656)</span>


```pony
fun box netrom_paclen()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### netrom_t1
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-657)</span>


```pony
fun box netrom_t1()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### netrom_t2
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-658)</span>


```pony
fun box netrom_t2()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### netrom_t4
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-659)</span>


```pony
fun box netrom_t4()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### nrdv_multicast_addrs_per_sock
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-660)</span>


```pony
fun box nrdv_multicast_addrs_per_sock()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### pvd_config
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-661)</span>


```pony
fun box pvd_config()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rds_cancel_sent_to
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-662)</span>


```pony
fun box rds_cancel_sent_to()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rds_cmsg_atomic_cswp
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-663)</span>


```pony
fun box rds_cmsg_atomic_cswp()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rds_cmsg_atomic_fadd
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-664)</span>


```pony
fun box rds_cmsg_atomic_fadd()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rds_cmsg_cong_update
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-665)</span>


```pony
fun box rds_cmsg_cong_update()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rds_cmsg_masked_atomic_cswp
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-666)</span>


```pony
fun box rds_cmsg_masked_atomic_cswp()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rds_cmsg_masked_atomic_fadd
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-667)</span>


```pony
fun box rds_cmsg_masked_atomic_fadd()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rds_cmsg_rdma_args
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-668)</span>


```pony
fun box rds_cmsg_rdma_args()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rds_cmsg_rdma_dest
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-669)</span>


```pony
fun box rds_cmsg_rdma_dest()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rds_cmsg_rdma_map
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-670)</span>


```pony
fun box rds_cmsg_rdma_map()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rds_cmsg_rdma_status
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-671)</span>


```pony
fun box rds_cmsg_rdma_status()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rds_cong_monitor
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-672)</span>


```pony
fun box rds_cong_monitor()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rds_cong_monitor_size
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-673)</span>


```pony
fun box rds_cong_monitor_size()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rds_free_mr
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-674)</span>


```pony
fun box rds_free_mr()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rds_get_mr
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-675)</span>


```pony
fun box rds_get_mr()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rds_get_mr_for_dest
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-676)</span>


```pony
fun box rds_get_mr_for_dest()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rds_ib_abi_version
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-677)</span>


```pony
fun box rds_ib_abi_version()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rds_ib_gid_len
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-678)</span>


```pony
fun box rds_ib_gid_len()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rds_info_connections
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-679)</span>


```pony
fun box rds_info_connections()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rds_info_connection_flag_connected
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-680)</span>


```pony
fun box rds_info_connection_flag_connected()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rds_info_connection_flag_connecting
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-681)</span>


```pony
fun box rds_info_connection_flag_connecting()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rds_info_connection_flag_sending
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-682)</span>


```pony
fun box rds_info_connection_flag_sending()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rds_info_connection_stats
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-683)</span>


```pony
fun box rds_info_connection_stats()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rds_info_counters
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-684)</span>


```pony
fun box rds_info_counters()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rds_info_first
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-685)</span>


```pony
fun box rds_info_first()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rds_info_ib_connections
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-686)</span>


```pony
fun box rds_info_ib_connections()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rds_info_iwarp_connections
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-687)</span>


```pony
fun box rds_info_iwarp_connections()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rds_info_last
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-688)</span>


```pony
fun box rds_info_last()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rds_info_message_flag_ack
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-689)</span>


```pony
fun box rds_info_message_flag_ack()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rds_info_message_flag_fast_ack
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-690)</span>


```pony
fun box rds_info_message_flag_fast_ack()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rds_info_recv_messages
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-691)</span>


```pony
fun box rds_info_recv_messages()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rds_info_retrans_messages
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-692)</span>


```pony
fun box rds_info_retrans_messages()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rds_info_send_messages
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-693)</span>


```pony
fun box rds_info_send_messages()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rds_info_sockets
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-694)</span>


```pony
fun box rds_info_sockets()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rds_info_tcp_sockets
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-695)</span>


```pony
fun box rds_info_tcp_sockets()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rds_rdma_canceled
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-696)</span>


```pony
fun box rds_rdma_canceled()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rds_rdma_dontwait
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-697)</span>


```pony
fun box rds_rdma_dontwait()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rds_rdma_dropped
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-698)</span>


```pony
fun box rds_rdma_dropped()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rds_rdma_fence
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-699)</span>


```pony
fun box rds_rdma_fence()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rds_rdma_invalidate
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-700)</span>


```pony
fun box rds_rdma_invalidate()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rds_rdma_notify_me
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-701)</span>


```pony
fun box rds_rdma_notify_me()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rds_rdma_other_error
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-702)</span>


```pony
fun box rds_rdma_other_error()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rds_rdma_readwrite
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-703)</span>


```pony
fun box rds_rdma_readwrite()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rds_rdma_remote_error
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-704)</span>


```pony
fun box rds_rdma_remote_error()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rds_rdma_silent
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-705)</span>


```pony
fun box rds_rdma_silent()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rds_rdma_success
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-706)</span>


```pony
fun box rds_rdma_success()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rds_rdma_use_once
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-707)</span>


```pony
fun box rds_rdma_use_once()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rds_recverr
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-708)</span>


```pony
fun box rds_recverr()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rds_trans_count
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-709)</span>


```pony
fun box rds_trans_count()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rds_trans_ib
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-710)</span>


```pony
fun box rds_trans_ib()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rds_trans_iwarp
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-711)</span>


```pony
fun box rds_trans_iwarp()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rds_trans_none
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-712)</span>


```pony
fun box rds_trans_none()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rds_trans_tcp
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-713)</span>


```pony
fun box rds_trans_tcp()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rose_access_barred
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-714)</span>


```pony
fun box rose_access_barred()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rose_defer
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-715)</span>


```pony
fun box rose_defer()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rose_dte_originated
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-716)</span>


```pony
fun box rose_dte_originated()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rose_holdback
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-717)</span>


```pony
fun box rose_holdback()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rose_idle
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-718)</span>


```pony
fun box rose_idle()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rose_invalid_facility
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-719)</span>


```pony
fun box rose_invalid_facility()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rose_local_procedure
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-720)</span>


```pony
fun box rose_local_procedure()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rose_max_digis
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-721)</span>


```pony
fun box rose_max_digis()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rose_mtu
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-722)</span>


```pony
fun box rose_mtu()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rose_network_congestion
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-723)</span>


```pony
fun box rose_network_congestion()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rose_not_obtainable
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-724)</span>


```pony
fun box rose_not_obtainable()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rose_number_busy
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-725)</span>


```pony
fun box rose_number_busy()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rose_out_of_order
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-726)</span>


```pony
fun box rose_out_of_order()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rose_qbitincl
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-727)</span>


```pony
fun box rose_qbitincl()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rose_remote_procedure
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-728)</span>


```pony
fun box rose_remote_procedure()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rose_ship_absent
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-729)</span>


```pony
fun box rose_ship_absent()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rose_t1
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-730)</span>


```pony
fun box rose_t1()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rose_t2
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-731)</span>


```pony
fun box rose_t2()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### rose_t3
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-732)</span>


```pony
fun box rose_t3()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### scm_hci_raw_direction
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-733)</span>


```pony
fun box scm_hci_raw_direction()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### scm_timestamp
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-734)</span>


```pony
fun box scm_timestamp()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### scm_timestamping
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-735)</span>


```pony
fun box scm_timestamping()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### scm_timestampns
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-736)</span>


```pony
fun box scm_timestampns()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### scm_wifi_status
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-737)</span>


```pony
fun box scm_wifi_status()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_abort_association
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-738)</span>


```pony
fun box sctp_abort_association()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_adaptation_layer
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-739)</span>


```pony
fun box sctp_adaptation_layer()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_adaption_layer
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-740)</span>


```pony
fun box sctp_adaption_layer()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_add_streams
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-741)</span>


```pony
fun box sctp_add_streams()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_add_vrf_id
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-742)</span>


```pony
fun box sctp_add_vrf_id()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_asconf
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-743)</span>


```pony
fun box sctp_asconf()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_asconf_ack
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-744)</span>


```pony
fun box sctp_asconf_ack()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_asconf_supported
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-745)</span>


```pony
fun box sctp_asconf_supported()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_associnfo
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-746)</span>


```pony
fun box sctp_associnfo()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_authentication
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-747)</span>


```pony
fun box sctp_authentication()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_auth_active_key
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-748)</span>


```pony
fun box sctp_auth_active_key()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_auth_chunk
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-749)</span>


```pony
fun box sctp_auth_chunk()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_auth_deactivate_key
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-750)</span>


```pony
fun box sctp_auth_deactivate_key()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_auth_delete_key
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-751)</span>


```pony
fun box sctp_auth_delete_key()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_auth_key
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-752)</span>


```pony
fun box sctp_auth_key()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_auth_supported
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-753)</span>


```pony
fun box sctp_auth_supported()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_autoclose
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-754)</span>


```pony
fun box sctp_autoclose()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_auto_asconf
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-755)</span>


```pony
fun box sctp_auto_asconf()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_badcrc
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-756)</span>


```pony
fun box sctp_badcrc()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_bindx_add_addr
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-757)</span>


```pony
fun box sctp_bindx_add_addr()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_bindx_rem_addr
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-758)</span>


```pony
fun box sctp_bindx_rem_addr()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_blk_logging_enable
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-759)</span>


```pony
fun box sctp_blk_logging_enable()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_bound
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-760)</span>


```pony
fun box sctp_bound()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_cause_cookie_in_shutdown
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-761)</span>


```pony
fun box sctp_cause_cookie_in_shutdown()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_cause_deleting_last_addr
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-762)</span>


```pony
fun box sctp_cause_deleting_last_addr()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_cause_deleting_src_addr
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-763)</span>


```pony
fun box sctp_cause_deleting_src_addr()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_cause_illegal_asconf_ack
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-764)</span>


```pony
fun box sctp_cause_illegal_asconf_ack()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_cause_invalid_param
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-765)</span>


```pony
fun box sctp_cause_invalid_param()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_cause_invalid_stream
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-766)</span>


```pony
fun box sctp_cause_invalid_stream()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_cause_missing_param
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-767)</span>


```pony
fun box sctp_cause_missing_param()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_cause_nat_colliding_state
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-768)</span>


```pony
fun box sctp_cause_nat_colliding_state()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_cause_nat_missing_state
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-769)</span>


```pony
fun box sctp_cause_nat_missing_state()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_cause_no_error
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-770)</span>


```pony
fun box sctp_cause_no_error()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_cause_no_user_data
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-771)</span>


```pony
fun box sctp_cause_no_user_data()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_cause_out_of_resc
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-772)</span>


```pony
fun box sctp_cause_out_of_resc()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_cause_protocol_violation
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-773)</span>


```pony
fun box sctp_cause_protocol_violation()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_cause_request_refused
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-774)</span>


```pony
fun box sctp_cause_request_refused()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_cause_resource_shortage
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-775)</span>


```pony
fun box sctp_cause_resource_shortage()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_cause_restart_w_newaddr
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-776)</span>


```pony
fun box sctp_cause_restart_w_newaddr()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_cause_stale_cookie
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-777)</span>


```pony
fun box sctp_cause_stale_cookie()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_cause_unrecog_chunk
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-778)</span>


```pony
fun box sctp_cause_unrecog_chunk()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_cause_unrecog_param
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-779)</span>


```pony
fun box sctp_cause_unrecog_param()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_cause_unresolvable_addr
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-780)</span>


```pony
fun box sctp_cause_unresolvable_addr()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_cause_unsupported_hmacid
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-781)</span>


```pony
fun box sctp_cause_unsupported_hmacid()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_cause_user_initiated_abt
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-782)</span>


```pony
fun box sctp_cause_user_initiated_abt()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_cc_hstcp
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-783)</span>


```pony
fun box sctp_cc_hstcp()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_cc_htcp
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-784)</span>


```pony
fun box sctp_cc_htcp()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_cc_option
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-785)</span>


```pony
fun box sctp_cc_option()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_cc_opt_rtcc_setmode
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-786)</span>


```pony
fun box sctp_cc_opt_rtcc_setmode()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_cc_opt_steady_step
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-787)</span>


```pony
fun box sctp_cc_opt_steady_step()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_cc_opt_use_dccc_ecn
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-788)</span>


```pony
fun box sctp_cc_opt_use_dccc_ecn()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_cc_rfc2581
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-789)</span>


```pony
fun box sctp_cc_rfc2581()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_cc_rtcc
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-790)</span>


```pony
fun box sctp_cc_rtcc()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_closed
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-791)</span>


```pony
fun box sctp_closed()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_clr_stat_log
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-792)</span>


```pony
fun box sctp_clr_stat_log()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_cmt_base
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-793)</span>


```pony
fun box sctp_cmt_base()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_cmt_max
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-794)</span>


```pony
fun box sctp_cmt_max()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_cmt_mptcp
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-795)</span>


```pony
fun box sctp_cmt_mptcp()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_cmt_off
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-796)</span>


```pony
fun box sctp_cmt_off()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_cmt_on_off
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-797)</span>


```pony
fun box sctp_cmt_on_off()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_cmt_rpv1
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-798)</span>


```pony
fun box sctp_cmt_rpv1()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_cmt_rpv2
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-799)</span>


```pony
fun box sctp_cmt_rpv2()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_cmt_use_dac
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-800)</span>


```pony
fun box sctp_cmt_use_dac()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_connect_x
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-801)</span>


```pony
fun box sctp_connect_x()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_connect_x_complete
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-802)</span>


```pony
fun box sctp_connect_x_complete()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_connect_x_delayed
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-803)</span>


```pony
fun box sctp_connect_x_delayed()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_context
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-804)</span>


```pony
fun box sctp_context()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_cookie_ack
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-805)</span>


```pony
fun box sctp_cookie_ack()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_cookie_echo
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-806)</span>


```pony
fun box sctp_cookie_echo()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_cookie_echoed
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-807)</span>


```pony
fun box sctp_cookie_echoed()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_cookie_wait
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-808)</span>


```pony
fun box sctp_cookie_wait()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_cwnd_logging_enable
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-809)</span>


```pony
fun box sctp_cwnd_logging_enable()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_cwnd_monitor_enable
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-810)</span>


```pony
fun box sctp_cwnd_monitor_enable()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_cwr_in_same_window
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-811)</span>


```pony
fun box sctp_cwr_in_same_window()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_cwr_reduce_override
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-812)</span>


```pony
fun box sctp_cwr_reduce_override()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_data
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-813)</span>


```pony
fun box sctp_data()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_data_first_frag
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-814)</span>


```pony
fun box sctp_data_first_frag()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_data_frag_mask
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-815)</span>


```pony
fun box sctp_data_frag_mask()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_data_last_frag
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-816)</span>


```pony
fun box sctp_data_last_frag()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_data_middle_frag
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-817)</span>


```pony
fun box sctp_data_middle_frag()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_data_not_frag
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-818)</span>


```pony
fun box sctp_data_not_frag()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_data_sack_immediately
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-819)</span>


```pony
fun box sctp_data_sack_immediately()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_data_unordered
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-820)</span>


```pony
fun box sctp_data_unordered()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_default_prinfo
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-821)</span>


```pony
fun box sctp_default_prinfo()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_default_send_param
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-822)</span>


```pony
fun box sctp_default_send_param()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_default_sndinfo
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-823)</span>


```pony
fun box sctp_default_sndinfo()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_delayed_sack
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-824)</span>


```pony
fun box sctp_delayed_sack()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_del_vrf_id
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-825)</span>


```pony
fun box sctp_del_vrf_id()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_disable_fragments
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-826)</span>


```pony
fun box sctp_disable_fragments()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_ecn_cwr
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-827)</span>


```pony
fun box sctp_ecn_cwr()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_ecn_echo
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-828)</span>


```pony
fun box sctp_ecn_echo()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_ecn_supported
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-829)</span>


```pony
fun box sctp_ecn_supported()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_enable_change_assoc_req
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-830)</span>


```pony
fun box sctp_enable_change_assoc_req()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_enable_reset_assoc_req
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-831)</span>


```pony
fun box sctp_enable_reset_assoc_req()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_enable_reset_stream_req
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-832)</span>


```pony
fun box sctp_enable_reset_stream_req()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_enable_stream_reset
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-833)</span>


```pony
fun box sctp_enable_stream_reset()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_enable_value_mask
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-834)</span>


```pony
fun box sctp_enable_value_mask()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_established
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-835)</span>


```pony
fun box sctp_established()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_event
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-836)</span>


```pony
fun box sctp_event()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_events
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-837)</span>


```pony
fun box sctp_events()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_explicit_eor
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-838)</span>


```pony
fun box sctp_explicit_eor()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_flight_logging_enable
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-839)</span>


```pony
fun box sctp_flight_logging_enable()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_forward_cum_tsn
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-840)</span>


```pony
fun box sctp_forward_cum_tsn()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_fragment_interleave
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-841)</span>


```pony
fun box sctp_fragment_interleave()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_frag_level_0
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-842)</span>


```pony
fun box sctp_frag_level_0()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_frag_level_1
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-843)</span>


```pony
fun box sctp_frag_level_1()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_frag_level_2
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-844)</span>


```pony
fun box sctp_frag_level_2()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_from_middle_box
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-845)</span>


```pony
fun box sctp_from_middle_box()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_fr_logging_enable
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-846)</span>


```pony
fun box sctp_fr_logging_enable()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_get_addr_len
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-847)</span>


```pony
fun box sctp_get_addr_len()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_get_asoc_vrf
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-848)</span>


```pony
fun box sctp_get_asoc_vrf()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_get_assoc_id_list
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-849)</span>


```pony
fun box sctp_get_assoc_id_list()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_get_assoc_number
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-850)</span>


```pony
fun box sctp_get_assoc_number()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_get_local_addresses
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-851)</span>


```pony
fun box sctp_get_local_addresses()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_get_local_addr_size
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-852)</span>


```pony
fun box sctp_get_local_addr_size()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_get_nonce_values
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-853)</span>


```pony
fun box sctp_get_nonce_values()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_get_packet_log
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-854)</span>


```pony
fun box sctp_get_packet_log()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_get_peer_addresses
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-855)</span>


```pony
fun box sctp_get_peer_addresses()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_get_peer_addr_info
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-856)</span>


```pony
fun box sctp_get_peer_addr_info()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_get_remote_addr_size
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-857)</span>


```pony
fun box sctp_get_remote_addr_size()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_get_sndbuf_use
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-858)</span>


```pony
fun box sctp_get_sndbuf_use()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_get_stat_log
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-859)</span>


```pony
fun box sctp_get_stat_log()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_get_vrf_ids
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-860)</span>


```pony
fun box sctp_get_vrf_ids()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_had_no_tcb
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-861)</span>


```pony
fun box sctp_had_no_tcb()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_heartbeat_ack
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-862)</span>


```pony
fun box sctp_heartbeat_ack()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_heartbeat_request
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-863)</span>


```pony
fun box sctp_heartbeat_request()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_hmac_ident
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-864)</span>


```pony
fun box sctp_hmac_ident()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_idata
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-865)</span>


```pony
fun box sctp_idata()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_iforward_cum_tsn
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-866)</span>


```pony
fun box sctp_iforward_cum_tsn()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_initiation
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-867)</span>


```pony
fun box sctp_initiation()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_initiation_ack
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-868)</span>


```pony
fun box sctp_initiation_ack()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_initmsg
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-869)</span>


```pony
fun box sctp_initmsg()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_interleaving_supported
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-870)</span>


```pony
fun box sctp_interleaving_supported()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_i_want_mapped_v4_addr
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-871)</span>


```pony
fun box sctp_i_want_mapped_v4_addr()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_last_packet_tracing
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-872)</span>


```pony
fun box sctp_last_packet_tracing()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_listen
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-873)</span>


```pony
fun box sctp_listen()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_local_auth_chunks
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-874)</span>


```pony
fun box sctp_local_auth_chunks()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_lock_logging_enable
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-875)</span>


```pony
fun box sctp_lock_logging_enable()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_log_at_send_2_outq
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-876)</span>


```pony
fun box sctp_log_at_send_2_outq()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_log_at_send_2_sctp
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-877)</span>


```pony
fun box sctp_log_at_send_2_sctp()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_log_maxburst_enable
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-878)</span>


```pony
fun box sctp_log_maxburst_enable()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_log_rwnd_enable
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-879)</span>


```pony
fun box sctp_log_rwnd_enable()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_log_sack_arrivals_enable
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-880)</span>


```pony
fun box sctp_log_sack_arrivals_enable()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_log_try_advance
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-881)</span>


```pony
fun box sctp_log_try_advance()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_ltrace_chunk_enable
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-882)</span>


```pony
fun box sctp_ltrace_chunk_enable()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_ltrace_error_enable
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-883)</span>


```pony
fun box sctp_ltrace_error_enable()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_map_logging_enable
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-884)</span>


```pony
fun box sctp_map_logging_enable()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_maxburst
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-885)</span>


```pony
fun box sctp_maxburst()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_maxseg
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-886)</span>


```pony
fun box sctp_maxseg()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_max_burst
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-887)</span>


```pony
fun box sctp_max_burst()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_max_cookie_life
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-888)</span>


```pony
fun box sctp_max_cookie_life()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_max_cwnd
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-889)</span>


```pony
fun box sctp_max_cwnd()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_max_hb_interval
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-890)</span>


```pony
fun box sctp_max_hb_interval()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_max_sack_delay
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-891)</span>


```pony
fun box sctp_max_sack_delay()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_mbcnt_logging_enable
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-892)</span>


```pony
fun box sctp_mbcnt_logging_enable()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_mbuf_logging_enable
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-893)</span>


```pony
fun box sctp_mbuf_logging_enable()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_mobility_base
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-894)</span>


```pony
fun box sctp_mobility_base()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_mobility_fasthandoff
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-895)</span>


```pony
fun box sctp_mobility_fasthandoff()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_mobility_prim_deleted
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-896)</span>


```pony
fun box sctp_mobility_prim_deleted()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_nagle_logging_enable
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-897)</span>


```pony
fun box sctp_nagle_logging_enable()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_nodelay
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-898)</span>


```pony
fun box sctp_nodelay()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_nrsack_supported
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-899)</span>


```pony
fun box sctp_nrsack_supported()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_nr_selective_ack
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-900)</span>


```pony
fun box sctp_nr_selective_ack()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_operation_error
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-901)</span>


```pony
fun box sctp_operation_error()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_packed
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-902)</span>


```pony
fun box sctp_packed()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_packet_dropped
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-903)</span>


```pony
fun box sctp_packet_dropped()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_packet_log_size
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-904)</span>


```pony
fun box sctp_packet_log_size()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_packet_truncated
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-905)</span>


```pony
fun box sctp_packet_truncated()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_pad_chunk
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-906)</span>


```pony
fun box sctp_pad_chunk()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_partial_delivery_point
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-907)</span>


```pony
fun box sctp_partial_delivery_point()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_pcb_copy_flags
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-908)</span>


```pony
fun box sctp_pcb_copy_flags()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_pcb_flags_accepting
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-909)</span>


```pony
fun box sctp_pcb_flags_accepting()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_pcb_flags_adaptationevnt
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-910)</span>


```pony
fun box sctp_pcb_flags_adaptationevnt()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_pcb_flags_assoc_resetevnt
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-911)</span>


```pony
fun box sctp_pcb_flags_assoc_resetevnt()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_pcb_flags_authevnt
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-912)</span>


```pony
fun box sctp_pcb_flags_authevnt()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_pcb_flags_autoclose
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-913)</span>


```pony
fun box sctp_pcb_flags_autoclose()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_pcb_flags_auto_asconf
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-914)</span>


```pony
fun box sctp_pcb_flags_auto_asconf()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_pcb_flags_blocking_io
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-915)</span>


```pony
fun box sctp_pcb_flags_blocking_io()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_pcb_flags_boundall
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-916)</span>


```pony
fun box sctp_pcb_flags_boundall()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_pcb_flags_bound_v6
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-917)</span>


```pony
fun box sctp_pcb_flags_bound_v6()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_pcb_flags_close_ip
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-918)</span>


```pony
fun box sctp_pcb_flags_close_ip()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_pcb_flags_connected
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-919)</span>


```pony
fun box sctp_pcb_flags_connected()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_pcb_flags_donot_heartbeat
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-920)</span>


```pony
fun box sctp_pcb_flags_donot_heartbeat()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_pcb_flags_dont_wake
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-921)</span>


```pony
fun box sctp_pcb_flags_dont_wake()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_pcb_flags_do_asconf
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-922)</span>


```pony
fun box sctp_pcb_flags_do_asconf()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_pcb_flags_do_not_pmtud
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-923)</span>


```pony
fun box sctp_pcb_flags_do_not_pmtud()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_pcb_flags_dryevnt
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-924)</span>


```pony
fun box sctp_pcb_flags_dryevnt()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_pcb_flags_explicit_eor
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-925)</span>


```pony
fun box sctp_pcb_flags_explicit_eor()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_pcb_flags_ext_rcvinfo
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-926)</span>


```pony
fun box sctp_pcb_flags_ext_rcvinfo()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_pcb_flags_frag_interleave
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-927)</span>


```pony
fun box sctp_pcb_flags_frag_interleave()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_pcb_flags_interleave_strms
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-928)</span>


```pony
fun box sctp_pcb_flags_interleave_strms()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_pcb_flags_in_tcppool
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-929)</span>


```pony
fun box sctp_pcb_flags_in_tcppool()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_pcb_flags_multiple_asconfs
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-930)</span>


```pony
fun box sctp_pcb_flags_multiple_asconfs()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_pcb_flags_needs_mapped_v4
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-931)</span>


```pony
fun box sctp_pcb_flags_needs_mapped_v4()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_pcb_flags_nodelay
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-932)</span>


```pony
fun box sctp_pcb_flags_nodelay()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_pcb_flags_no_fragment
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-933)</span>


```pony
fun box sctp_pcb_flags_no_fragment()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_pcb_flags_pdapievnt
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-934)</span>


```pony
fun box sctp_pcb_flags_pdapievnt()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_pcb_flags_portreuse
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-935)</span>


```pony
fun box sctp_pcb_flags_portreuse()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_pcb_flags_recvassocevnt
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-936)</span>


```pony
fun box sctp_pcb_flags_recvassocevnt()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_pcb_flags_recvdataioevnt
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-937)</span>


```pony
fun box sctp_pcb_flags_recvdataioevnt()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_pcb_flags_recvnsendfailevnt
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-938)</span>


```pony
fun box sctp_pcb_flags_recvnsendfailevnt()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_pcb_flags_recvnxtinfo
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-939)</span>


```pony
fun box sctp_pcb_flags_recvnxtinfo()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_pcb_flags_recvpaddrevnt
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-940)</span>


```pony
fun box sctp_pcb_flags_recvpaddrevnt()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_pcb_flags_recvpeererr
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-941)</span>


```pony
fun box sctp_pcb_flags_recvpeererr()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_pcb_flags_recvrcvinfo
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-942)</span>


```pony
fun box sctp_pcb_flags_recvrcvinfo()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_pcb_flags_recvsendfailevnt
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-943)</span>


```pony
fun box sctp_pcb_flags_recvsendfailevnt()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_pcb_flags_recvshutdownevnt
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-944)</span>


```pony
fun box sctp_pcb_flags_recvshutdownevnt()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_pcb_flags_socket_allgone
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-945)</span>


```pony
fun box sctp_pcb_flags_socket_allgone()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_pcb_flags_socket_cant_read
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-946)</span>


```pony
fun box sctp_pcb_flags_socket_cant_read()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_pcb_flags_socket_gone
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-947)</span>


```pony
fun box sctp_pcb_flags_socket_gone()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_pcb_flags_stream_changeevnt
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-948)</span>


```pony
fun box sctp_pcb_flags_stream_changeevnt()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_pcb_flags_stream_resetevnt
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-949)</span>


```pony
fun box sctp_pcb_flags_stream_resetevnt()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_pcb_flags_tcptype
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-950)</span>


```pony
fun box sctp_pcb_flags_tcptype()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_pcb_flags_udptype
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-951)</span>


```pony
fun box sctp_pcb_flags_udptype()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_pcb_flags_unbound
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-952)</span>


```pony
fun box sctp_pcb_flags_unbound()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_pcb_flags_wakeinput
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-953)</span>


```pony
fun box sctp_pcb_flags_wakeinput()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_pcb_flags_wakeoutput
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-954)</span>


```pony
fun box sctp_pcb_flags_wakeoutput()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_pcb_flags_was_aborted
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-955)</span>


```pony
fun box sctp_pcb_flags_was_aborted()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_pcb_flags_was_connected
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-956)</span>


```pony
fun box sctp_pcb_flags_was_connected()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_pcb_flags_zero_copy_active
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-957)</span>


```pony
fun box sctp_pcb_flags_zero_copy_active()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_pcb_status
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-958)</span>


```pony
fun box sctp_pcb_status()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_peeloff
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-959)</span>


```pony
fun box sctp_peeloff()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_peer_addr_params
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-960)</span>


```pony
fun box sctp_peer_addr_params()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_peer_addr_thlds
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-961)</span>


```pony
fun box sctp_peer_addr_thlds()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_peer_auth_chunks
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-962)</span>


```pony
fun box sctp_peer_auth_chunks()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_pktdrop_supported
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-963)</span>


```pony
fun box sctp_pktdrop_supported()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_pluggable_cc
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-964)</span>


```pony
fun box sctp_pluggable_cc()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_pluggable_ss
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-965)</span>


```pony
fun box sctp_pluggable_ss()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_primary_addr
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-966)</span>


```pony
fun box sctp_primary_addr()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_pr_assoc_status
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-967)</span>


```pony
fun box sctp_pr_assoc_status()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_pr_stream_status
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-968)</span>


```pony
fun box sctp_pr_stream_status()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_pr_supported
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-969)</span>


```pony
fun box sctp_pr_supported()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_reconfig_supported
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-970)</span>


```pony
fun box sctp_reconfig_supported()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_recvnxtinfo
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-971)</span>


```pony
fun box sctp_recvnxtinfo()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_recvrcvinfo
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-972)</span>


```pony
fun box sctp_recvrcvinfo()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_recv_rwnd_logging_enable
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-973)</span>


```pony
fun box sctp_recv_rwnd_logging_enable()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_remote_udp_encaps_port
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-974)</span>


```pony
fun box sctp_remote_udp_encaps_port()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_reset_assoc
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-975)</span>


```pony
fun box sctp_reset_assoc()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_reset_streams
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-976)</span>


```pony
fun box sctp_reset_streams()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_reuse_port
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-977)</span>


```pony
fun box sctp_reuse_port()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_rtoinfo
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-978)</span>


```pony
fun box sctp_rtoinfo()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_rttvar_logging_enable
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-979)</span>


```pony
fun box sctp_rttvar_logging_enable()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_sack_cmt_dac
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-980)</span>


```pony
fun box sctp_sack_cmt_dac()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_sack_logging_enable
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-981)</span>


```pony
fun box sctp_sack_logging_enable()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_sack_nonce_sum
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-982)</span>


```pony
fun box sctp_sack_nonce_sum()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_sack_rwnd_logging_enable
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-983)</span>


```pony
fun box sctp_sack_rwnd_logging_enable()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_sat_network_burst_incr
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-984)</span>


```pony
fun box sctp_sat_network_burst_incr()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_sat_network_min
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-985)</span>


```pony
fun box sctp_sat_network_min()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_sb_logging_enable
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-986)</span>


```pony
fun box sctp_sb_logging_enable()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_selective_ack
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-987)</span>


```pony
fun box sctp_selective_ack()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_set_debug_level
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-988)</span>


```pony
fun box sctp_set_debug_level()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_set_dynamic_primary
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-989)</span>


```pony
fun box sctp_set_dynamic_primary()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_set_initial_dbg_seq
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-990)</span>


```pony
fun box sctp_set_initial_dbg_seq()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_set_peer_primary_addr
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-991)</span>


```pony
fun box sctp_set_peer_primary_addr()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_shutdown
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-992)</span>


```pony
fun box sctp_shutdown()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_shutdown_ack
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-993)</span>


```pony
fun box sctp_shutdown_ack()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_shutdown_ack_sent
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-994)</span>


```pony
fun box sctp_shutdown_ack_sent()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_shutdown_complete
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-995)</span>


```pony
fun box sctp_shutdown_complete()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_shutdown_pending
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-996)</span>


```pony
fun box sctp_shutdown_pending()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_shutdown_received
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-997)</span>


```pony
fun box sctp_shutdown_received()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_shutdown_sent
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-998)</span>


```pony
fun box sctp_shutdown_sent()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_smallest_pmtu
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-999)</span>


```pony
fun box sctp_smallest_pmtu()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_ss_default
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1000)</span>


```pony
fun box sctp_ss_default()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_ss_fair_bandwith
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1001)</span>


```pony
fun box sctp_ss_fair_bandwith()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_ss_first_come
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1002)</span>


```pony
fun box sctp_ss_first_come()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_ss_priority
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1003)</span>


```pony
fun box sctp_ss_priority()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_ss_round_robin
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1004)</span>


```pony
fun box sctp_ss_round_robin()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_ss_round_robin_packet
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1005)</span>


```pony
fun box sctp_ss_round_robin_packet()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_ss_value
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1006)</span>


```pony
fun box sctp_ss_value()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_status
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1007)</span>


```pony
fun box sctp_status()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_stream_reset
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1008)</span>


```pony
fun box sctp_stream_reset()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_stream_reset_incoming
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1009)</span>


```pony
fun box sctp_stream_reset_incoming()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_stream_reset_outgoing
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1010)</span>


```pony
fun box sctp_stream_reset_outgoing()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_str_logging_enable
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1011)</span>


```pony
fun box sctp_str_logging_enable()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_threshold_logging
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1012)</span>


```pony
fun box sctp_threshold_logging()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_timeouts
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1013)</span>


```pony
fun box sctp_timeouts()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_use_ext_rcvinfo
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1014)</span>


```pony
fun box sctp_use_ext_rcvinfo()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_vrf_id
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1015)</span>


```pony
fun box sctp_vrf_id()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sctp_wake_logging_enable
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1016)</span>


```pony
fun box sctp_wake_logging_enable()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sock_cloexec
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1017)</span>


```pony
fun box sock_cloexec()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sock_dgram
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1018)</span>


```pony
fun box sock_dgram()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sock_maxaddrlen
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1019)</span>


```pony
fun box sock_maxaddrlen()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sock_nonblock
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1020)</span>


```pony
fun box sock_nonblock()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sock_raw
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1021)</span>


```pony
fun box sock_raw()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sock_rdm
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1022)</span>


```pony
fun box sock_rdm()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sock_seqpacket
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1023)</span>


```pony
fun box sock_seqpacket()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sock_stream
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1024)</span>


```pony
fun box sock_stream()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### somaxconn
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1025)</span>


```pony
fun box somaxconn()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### sonpx_setoptshut
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1026)</span>


```pony
fun box sonpx_setoptshut()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_acceptconn
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1027)</span>


```pony
fun box so_acceptconn()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_acceptfilter
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1028)</span>


```pony
fun box so_acceptfilter()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_atmpvc
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1029)</span>


```pony
fun box so_atmpvc()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_atmqos
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1030)</span>


```pony
fun box so_atmqos()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_atmsap
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1031)</span>


```pony
fun box so_atmsap()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_attach_bpf
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1032)</span>


```pony
fun box so_attach_bpf()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_attach_filter
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1033)</span>


```pony
fun box so_attach_filter()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_bindtodevice
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1034)</span>


```pony
fun box so_bindtodevice()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_bintime
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1035)</span>


```pony
fun box so_bintime()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_bpf_extensions
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1036)</span>


```pony
fun box so_bpf_extensions()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_broadcast
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1037)</span>


```pony
fun box so_broadcast()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_bsdcompat
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1038)</span>


```pony
fun box so_bsdcompat()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_bsp_state
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1039)</span>


```pony
fun box so_bsp_state()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_busy_poll
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1040)</span>


```pony
fun box so_busy_poll()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_conaccess
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1041)</span>


```pony
fun box so_conaccess()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_condata
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1042)</span>


```pony
fun box so_condata()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_conditional_accept
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1043)</span>


```pony
fun box so_conditional_accept()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_connect_time
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1044)</span>


```pony
fun box so_connect_time()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_debug
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1045)</span>


```pony
fun box so_debug()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_detach_bpf
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1046)</span>


```pony
fun box so_detach_bpf()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_detach_filter
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1047)</span>


```pony
fun box so_detach_filter()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_domain
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1048)</span>


```pony
fun box so_domain()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_dontlinger
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1049)</span>


```pony
fun box so_dontlinger()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_dontroute
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1050)</span>


```pony
fun box so_dontroute()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_donttrunc
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1051)</span>


```pony
fun box so_donttrunc()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_error
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1052)</span>


```pony
fun box so_error()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_exclusiveaddruse
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1053)</span>


```pony
fun box so_exclusiveaddruse()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_get_filter
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1054)</span>


```pony
fun box so_get_filter()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_group_id
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1055)</span>


```pony
fun box so_group_id()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_group_priority
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1056)</span>


```pony
fun box so_group_priority()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_hci_raw_direction
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1057)</span>


```pony
fun box so_hci_raw_direction()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_hci_raw_filter
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1058)</span>


```pony
fun box so_hci_raw_filter()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_incoming_cpu
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1059)</span>


```pony
fun box so_incoming_cpu()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_keepalive
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1060)</span>


```pony
fun box so_keepalive()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_l2cap_encrypted
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1061)</span>


```pony
fun box so_l2cap_encrypted()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_l2cap_flush
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1062)</span>


```pony
fun box so_l2cap_flush()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_l2cap_iflow
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1063)</span>


```pony
fun box so_l2cap_iflow()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_l2cap_imtu
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1064)</span>


```pony
fun box so_l2cap_imtu()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_l2cap_oflow
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1065)</span>


```pony
fun box so_l2cap_oflow()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_l2cap_omtu
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1066)</span>


```pony
fun box so_l2cap_omtu()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_label
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1067)</span>


```pony
fun box so_label()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_linger
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1068)</span>


```pony
fun box so_linger()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_linger_sec
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1069)</span>


```pony
fun box so_linger_sec()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_linkinfo
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1070)</span>


```pony
fun box so_linkinfo()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_listenincqlen
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1071)</span>


```pony
fun box so_listenincqlen()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_listenqlen
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1072)</span>


```pony
fun box so_listenqlen()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_listenqlimit
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1073)</span>


```pony
fun box so_listenqlimit()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_lock_filter
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1074)</span>


```pony
fun box so_lock_filter()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_mark
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1075)</span>


```pony
fun box so_mark()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_max_msg_size
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1076)</span>


```pony
fun box so_max_msg_size()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_max_pacing_rate
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1077)</span>


```pony
fun box so_max_pacing_rate()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_multipoint
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1078)</span>


```pony
fun box so_multipoint()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_netsvc_marking_level
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1079)</span>


```pony
fun box so_netsvc_marking_level()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_net_service_type
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1080)</span>


```pony
fun box so_net_service_type()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_nke
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1081)</span>


```pony
fun box so_nke()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_noaddrerr
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1082)</span>


```pony
fun box so_noaddrerr()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_nofcs
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1083)</span>


```pony
fun box so_nofcs()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_nosigpipe
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1084)</span>


```pony
fun box so_nosigpipe()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_notifyconflict
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1085)</span>


```pony
fun box so_notifyconflict()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_no_check
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1086)</span>


```pony
fun box so_no_check()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_no_ddp
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1087)</span>


```pony
fun box so_no_ddp()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_no_offload
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1088)</span>


```pony
fun box so_no_offload()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_np_extensions
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1089)</span>


```pony
fun box so_np_extensions()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_nread
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1090)</span>


```pony
fun box so_nread()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_numrcvpkt
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1091)</span>


```pony
fun box so_numrcvpkt()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_nwrite
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1092)</span>


```pony
fun box so_nwrite()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_oobinline
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1093)</span>


```pony
fun box so_oobinline()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_original_dst
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1094)</span>


```pony
fun box so_original_dst()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_passcred
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1095)</span>


```pony
fun box so_passcred()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_passsec
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1096)</span>


```pony
fun box so_passsec()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_peek_off
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1097)</span>


```pony
fun box so_peek_off()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_peercred
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1098)</span>


```pony
fun box so_peercred()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_peerlabel
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1099)</span>


```pony
fun box so_peerlabel()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_peername
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1100)</span>


```pony
fun box so_peername()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_peersec
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1101)</span>


```pony
fun box so_peersec()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_port_scalability
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1102)</span>


```pony
fun box so_port_scalability()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_priority
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1103)</span>


```pony
fun box so_priority()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_protocol
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1104)</span>


```pony
fun box so_protocol()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_protocol_info
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1105)</span>


```pony
fun box so_protocol_info()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_prototype
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1106)</span>


```pony
fun box so_prototype()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_proxyusr
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1107)</span>


```pony
fun box so_proxyusr()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_randomport
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1108)</span>


```pony
fun box so_randomport()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_rcvbuf
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1109)</span>


```pony
fun box so_rcvbuf()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_rcvbufforce
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1110)</span>


```pony
fun box so_rcvbufforce()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_rcvlowat
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1111)</span>


```pony
fun box so_rcvlowat()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_rcvtimeo
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1112)</span>


```pony
fun box so_rcvtimeo()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_rds_transport
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1113)</span>


```pony
fun box so_rds_transport()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_reuseaddr
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1114)</span>


```pony
fun box so_reuseaddr()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_reuseport
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1115)</span>


```pony
fun box so_reuseport()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_reuseshareuid
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1116)</span>


```pony
fun box so_reuseshareuid()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_rfcomm_fc_info
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1117)</span>


```pony
fun box so_rfcomm_fc_info()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_rfcomm_mtu
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1118)</span>


```pony
fun box so_rfcomm_mtu()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_rxq_ovfl
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1119)</span>


```pony
fun box so_rxq_ovfl()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_sco_conninfo
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1120)</span>


```pony
fun box so_sco_conninfo()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_sco_mtu
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1121)</span>


```pony
fun box so_sco_mtu()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_security_authentication
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1122)</span>


```pony
fun box so_security_authentication()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_security_encryption_network
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1123)</span>


```pony
fun box so_security_encryption_network()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_security_encryption_transport
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1124)</span>


```pony
fun box so_security_encryption_transport()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_select_err_queue
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1125)</span>


```pony
fun box so_select_err_queue()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_setclp
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1126)</span>


```pony
fun box so_setclp()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_setfib
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1127)</span>


```pony
fun box so_setfib()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_sndbuf
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1128)</span>


```pony
fun box so_sndbuf()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_sndbufforce
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1129)</span>


```pony
fun box so_sndbufforce()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_sndlowat
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1130)</span>


```pony
fun box so_sndlowat()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_sndtimeo
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1131)</span>


```pony
fun box so_sndtimeo()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_timestamp
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1132)</span>


```pony
fun box so_timestamp()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_timestamping
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1133)</span>


```pony
fun box so_timestamping()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_timestampns
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1134)</span>


```pony
fun box so_timestampns()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_timestamp_monotonic
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1135)</span>


```pony
fun box so_timestamp_monotonic()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_type
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1136)</span>


```pony
fun box so_type()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_upcallclosewait
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1137)</span>


```pony
fun box so_upcallclosewait()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_update_accept_context
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1138)</span>


```pony
fun box so_update_accept_context()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_useloopback
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1139)</span>


```pony
fun box so_useloopback()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_user_cookie
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1140)</span>


```pony
fun box so_user_cookie()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_vendor
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1141)</span>


```pony
fun box so_vendor()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_vm_sockets_buffer_max_size
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1142)</span>


```pony
fun box so_vm_sockets_buffer_max_size()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_vm_sockets_buffer_min_size
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1143)</span>


```pony
fun box so_vm_sockets_buffer_min_size()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_vm_sockets_buffer_size
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1144)</span>


```pony
fun box so_vm_sockets_buffer_size()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_vm_sockets_connect_timeout
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1145)</span>


```pony
fun box so_vm_sockets_connect_timeout()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_vm_sockets_nonblock_txrx
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1146)</span>


```pony
fun box so_vm_sockets_nonblock_txrx()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_vm_sockets_peer_host_vm_id
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1147)</span>


```pony
fun box so_vm_sockets_peer_host_vm_id()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_vm_sockets_trusted
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1148)</span>


```pony
fun box so_vm_sockets_trusted()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_wantmore
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1149)</span>


```pony
fun box so_wantmore()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_wantoobflag
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1150)</span>


```pony
fun box so_wantoobflag()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_wifi_status
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1151)</span>


```pony
fun box so_wifi_status()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcp6_mss
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1152)</span>


```pony
fun box tcp6_mss()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcpci_flag_lossrecovery
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1153)</span>


```pony
fun box tcpci_flag_lossrecovery()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcpci_flag_reordering_detected
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1154)</span>


```pony
fun box tcpci_flag_reordering_detected()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcpci_opt_ecn
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1155)</span>


```pony
fun box tcpci_opt_ecn()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcpci_opt_sack
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1156)</span>


```pony
fun box tcpci_opt_sack()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcpci_opt_timestamps
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1157)</span>


```pony
fun box tcpci_opt_timestamps()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcpci_opt_wscale
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1158)</span>


```pony
fun box tcpci_opt_wscale()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcpf_ca_cwr
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1159)</span>


```pony
fun box tcpf_ca_cwr()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcpf_ca_disorder
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1160)</span>


```pony
fun box tcpf_ca_disorder()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcpf_ca_loss
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1161)</span>


```pony
fun box tcpf_ca_loss()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcpf_ca_open
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1162)</span>


```pony
fun box tcpf_ca_open()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcpf_ca_recovery
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1163)</span>


```pony
fun box tcpf_ca_recovery()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcpi_opt_ecn
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1164)</span>


```pony
fun box tcpi_opt_ecn()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcpi_opt_ecn_seen
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1165)</span>


```pony
fun box tcpi_opt_ecn_seen()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcpi_opt_sack
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1166)</span>


```pony
fun box tcpi_opt_sack()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcpi_opt_syn_data
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1167)</span>


```pony
fun box tcpi_opt_syn_data()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcpi_opt_timestamps
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1168)</span>


```pony
fun box tcpi_opt_timestamps()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcpi_opt_toe
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1169)</span>


```pony
fun box tcpi_opt_toe()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcpi_opt_wscale
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1170)</span>


```pony
fun box tcpi_opt_wscale()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcpolen_cc
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1171)</span>


```pony
fun box tcpolen_cc()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcpolen_cc_appa
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1172)</span>


```pony
fun box tcpolen_cc_appa()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcpolen_eol
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1173)</span>


```pony
fun box tcpolen_eol()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcpolen_fastopen_req
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1174)</span>


```pony
fun box tcpolen_fastopen_req()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcpolen_fast_open_empty
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1175)</span>


```pony
fun box tcpolen_fast_open_empty()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcpolen_fast_open_max
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1176)</span>


```pony
fun box tcpolen_fast_open_max()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcpolen_fast_open_min
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1177)</span>


```pony
fun box tcpolen_fast_open_min()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcpolen_maxseg
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1178)</span>


```pony
fun box tcpolen_maxseg()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcpolen_nop
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1179)</span>


```pony
fun box tcpolen_nop()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcpolen_pad
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1180)</span>


```pony
fun box tcpolen_pad()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcpolen_sack
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1181)</span>


```pony
fun box tcpolen_sack()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcpolen_sackhdr
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1182)</span>


```pony
fun box tcpolen_sackhdr()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcpolen_sack_permitted
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1183)</span>


```pony
fun box tcpolen_sack_permitted()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcpolen_signature
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1184)</span>


```pony
fun box tcpolen_signature()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcpolen_timestamp
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1185)</span>


```pony
fun box tcpolen_timestamp()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcpolen_tstamp_appa
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1186)</span>


```pony
fun box tcpolen_tstamp_appa()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcpolen_window
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1187)</span>


```pony
fun box tcpolen_window()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcpopt_cc
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1188)</span>


```pony
fun box tcpopt_cc()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcpopt_ccecho
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1189)</span>


```pony
fun box tcpopt_ccecho()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcpopt_ccnew
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1190)</span>


```pony
fun box tcpopt_ccnew()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcpopt_eol
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1191)</span>


```pony
fun box tcpopt_eol()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcpopt_fastopen
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1192)</span>


```pony
fun box tcpopt_fastopen()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcpopt_fast_open
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1193)</span>


```pony
fun box tcpopt_fast_open()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcpopt_maxseg
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1194)</span>


```pony
fun box tcpopt_maxseg()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcpopt_multipath
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1195)</span>


```pony
fun box tcpopt_multipath()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcpopt_nop
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1196)</span>


```pony
fun box tcpopt_nop()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcpopt_pad
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1197)</span>


```pony
fun box tcpopt_pad()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcpopt_sack
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1198)</span>


```pony
fun box tcpopt_sack()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcpopt_sack_hdr
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1199)</span>


```pony
fun box tcpopt_sack_hdr()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcpopt_sack_permitted
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1200)</span>


```pony
fun box tcpopt_sack_permitted()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcpopt_sack_permit_hdr
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1201)</span>


```pony
fun box tcpopt_sack_permit_hdr()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcpopt_signature
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1202)</span>


```pony
fun box tcpopt_signature()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcpopt_timestamp
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1203)</span>


```pony
fun box tcpopt_timestamp()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcpopt_tstamp_hdr
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1204)</span>


```pony
fun box tcpopt_tstamp_hdr()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcpopt_window
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1205)</span>


```pony
fun box tcpopt_window()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcp_ca_name_max
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1206)</span>


```pony
fun box tcp_ca_name_max()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcp_ccalgoopt
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1207)</span>


```pony
fun box tcp_ccalgoopt()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcp_cc_info
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1208)</span>


```pony
fun box tcp_cc_info()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcp_congestion
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1209)</span>


```pony
fun box tcp_congestion()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcp_connectiontimeout
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1210)</span>


```pony
fun box tcp_connectiontimeout()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcp_connection_info
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1211)</span>


```pony
fun box tcp_connection_info()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcp_cookie_in_always
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1212)</span>


```pony
fun box tcp_cookie_in_always()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcp_cookie_max
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1213)</span>


```pony
fun box tcp_cookie_max()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcp_cookie_min
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1214)</span>


```pony
fun box tcp_cookie_min()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcp_cookie_out_never
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1215)</span>


```pony
fun box tcp_cookie_out_never()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcp_cookie_pair_size
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1216)</span>


```pony
fun box tcp_cookie_pair_size()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcp_cookie_transactions
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1217)</span>


```pony
fun box tcp_cookie_transactions()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcp_cork
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1218)</span>


```pony
fun box tcp_cork()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcp_defer_accept
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1219)</span>


```pony
fun box tcp_defer_accept()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcp_enable_ecn
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1220)</span>


```pony
fun box tcp_enable_ecn()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcp_fastopen
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1221)</span>


```pony
fun box tcp_fastopen()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcp_function_blk
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1222)</span>


```pony
fun box tcp_function_blk()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcp_function_name_len_max
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1223)</span>


```pony
fun box tcp_function_name_len_max()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcp_info
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1224)</span>


```pony
fun box tcp_info()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcp_keepalive
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1225)</span>


```pony
fun box tcp_keepalive()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcp_keepcnt
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1226)</span>


```pony
fun box tcp_keepcnt()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcp_keepidle
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1227)</span>


```pony
fun box tcp_keepidle()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcp_keepinit
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1228)</span>


```pony
fun box tcp_keepinit()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcp_keepintvl
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1229)</span>


```pony
fun box tcp_keepintvl()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcp_linger2
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1230)</span>


```pony
fun box tcp_linger2()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcp_maxburst
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1231)</span>


```pony
fun box tcp_maxburst()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcp_maxhlen
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1232)</span>


```pony
fun box tcp_maxhlen()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcp_maxolen
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1233)</span>


```pony
fun box tcp_maxolen()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcp_maxseg
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1234)</span>


```pony
fun box tcp_maxseg()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcp_maxwin
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1235)</span>


```pony
fun box tcp_maxwin()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcp_max_sack
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1236)</span>


```pony
fun box tcp_max_sack()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcp_max_winshift
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1237)</span>


```pony
fun box tcp_max_winshift()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcp_md5sig
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1238)</span>


```pony
fun box tcp_md5sig()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcp_md5sig_maxkeylen
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1239)</span>


```pony
fun box tcp_md5sig_maxkeylen()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcp_minmss
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1240)</span>


```pony
fun box tcp_minmss()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcp_mss
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1241)</span>


```pony
fun box tcp_mss()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcp_mss_default
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1242)</span>


```pony
fun box tcp_mss_default()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcp_mss_desired
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1243)</span>


```pony
fun box tcp_mss_desired()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcp_nodelay
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1244)</span>


```pony
fun box tcp_nodelay()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcp_noopt
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1245)</span>


```pony
fun box tcp_noopt()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcp_nopush
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1246)</span>


```pony
fun box tcp_nopush()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcp_notsent_lowat
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1247)</span>


```pony
fun box tcp_notsent_lowat()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcp_pcap_in
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1248)</span>


```pony
fun box tcp_pcap_in()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcp_pcap_out
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1249)</span>


```pony
fun box tcp_pcap_out()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcp_queue_seq
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1250)</span>


```pony
fun box tcp_queue_seq()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcp_quickack
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1251)</span>


```pony
fun box tcp_quickack()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcp_repair
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1252)</span>


```pony
fun box tcp_repair()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcp_repair_options
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1253)</span>


```pony
fun box tcp_repair_options()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcp_repair_queue
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1254)</span>


```pony
fun box tcp_repair_queue()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcp_rxt_conndroptime
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1255)</span>


```pony
fun box tcp_rxt_conndroptime()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcp_rxt_findrop
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1256)</span>


```pony
fun box tcp_rxt_findrop()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcp_saved_syn
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1257)</span>


```pony
fun box tcp_saved_syn()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcp_save_syn
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1258)</span>


```pony
fun box tcp_save_syn()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcp_sendmoreacks
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1259)</span>


```pony
fun box tcp_sendmoreacks()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcp_syncnt
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1260)</span>


```pony
fun box tcp_syncnt()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcp_s_data_in
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1261)</span>


```pony
fun box tcp_s_data_in()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcp_s_data_out
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1262)</span>


```pony
fun box tcp_s_data_out()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcp_thin_dupack
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1263)</span>


```pony
fun box tcp_thin_dupack()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcp_thin_linear_timeouts
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1264)</span>


```pony
fun box tcp_thin_linear_timeouts()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcp_timestamp
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1265)</span>


```pony
fun box tcp_timestamp()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcp_user_timeout
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1266)</span>


```pony
fun box tcp_user_timeout()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcp_vendor
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1267)</span>


```pony
fun box tcp_vendor()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tcp_window_clamp
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1268)</span>


```pony
fun box tcp_window_clamp()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tipc_addr_id
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1269)</span>


```pony
fun box tipc_addr_id()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tipc_addr_mcast
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1270)</span>


```pony
fun box tipc_addr_mcast()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tipc_addr_name
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1271)</span>


```pony
fun box tipc_addr_name()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tipc_addr_nameseq
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1272)</span>


```pony
fun box tipc_addr_nameseq()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tipc_cfg_srv
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1273)</span>


```pony
fun box tipc_cfg_srv()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tipc_cluster_scope
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1274)</span>


```pony
fun box tipc_cluster_scope()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tipc_conn_shutdown
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1275)</span>


```pony
fun box tipc_conn_shutdown()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tipc_conn_timeout
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1276)</span>


```pony
fun box tipc_conn_timeout()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tipc_critical_importance
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1277)</span>


```pony
fun box tipc_critical_importance()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tipc_destname
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1278)</span>


```pony
fun box tipc_destname()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tipc_dest_droppable
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1279)</span>


```pony
fun box tipc_dest_droppable()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tipc_errinfo
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1280)</span>


```pony
fun box tipc_errinfo()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tipc_err_no_name
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1281)</span>


```pony
fun box tipc_err_no_name()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tipc_err_no_node
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1282)</span>


```pony
fun box tipc_err_no_node()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tipc_err_no_port
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1283)</span>


```pony
fun box tipc_err_no_port()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tipc_err_overload
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1284)</span>


```pony
fun box tipc_err_overload()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tipc_high_importance
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1285)</span>


```pony
fun box tipc_high_importance()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tipc_importance
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1286)</span>


```pony
fun box tipc_importance()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tipc_link_state
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1287)</span>


```pony
fun box tipc_link_state()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tipc_low_importance
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1288)</span>


```pony
fun box tipc_low_importance()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tipc_max_bearer_name
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1289)</span>


```pony
fun box tipc_max_bearer_name()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tipc_max_if_name
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1290)</span>


```pony
fun box tipc_max_if_name()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tipc_max_link_name
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1291)</span>


```pony
fun box tipc_max_link_name()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tipc_max_media_name
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1292)</span>


```pony
fun box tipc_max_media_name()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tipc_max_user_msg_size
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1293)</span>


```pony
fun box tipc_max_user_msg_size()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tipc_medium_importance
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1294)</span>


```pony
fun box tipc_medium_importance()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tipc_node_recvq_depth
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1295)</span>


```pony
fun box tipc_node_recvq_depth()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tipc_node_scope
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1296)</span>


```pony
fun box tipc_node_scope()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tipc_ok
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1297)</span>


```pony
fun box tipc_ok()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tipc_published
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1298)</span>


```pony
fun box tipc_published()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tipc_reserved_types
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1299)</span>


```pony
fun box tipc_reserved_types()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tipc_retdata
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1300)</span>


```pony
fun box tipc_retdata()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tipc_sock_recvq_depth
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1301)</span>


```pony
fun box tipc_sock_recvq_depth()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tipc_src_droppable
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1302)</span>


```pony
fun box tipc_src_droppable()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tipc_subscr_timeout
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1303)</span>


```pony
fun box tipc_subscr_timeout()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tipc_sub_cancel
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1304)</span>


```pony
fun box tipc_sub_cancel()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tipc_sub_ports
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1305)</span>


```pony
fun box tipc_sub_ports()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tipc_sub_service
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1306)</span>


```pony
fun box tipc_sub_service()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tipc_top_srv
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1307)</span>


```pony
fun box tipc_top_srv()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tipc_wait_forever
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1308)</span>


```pony
fun box tipc_wait_forever()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tipc_withdrawn
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1309)</span>


```pony
fun box tipc_withdrawn()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### tipc_zone_scope
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1310)</span>


```pony
fun box tipc_zone_scope()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### ttcp_client_snd_wnd
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1311)</span>


```pony
fun box ttcp_client_snd_wnd()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### udp_cork
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1312)</span>


```pony
fun box udp_cork()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### udp_encap
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1313)</span>


```pony
fun box udp_encap()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### udp_encap_espinudp
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1314)</span>


```pony
fun box udp_encap_espinudp()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### udp_encap_espinudp_maxfraglen
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1315)</span>


```pony
fun box udp_encap_espinudp_maxfraglen()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### udp_encap_espinudp_non_ike
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1316)</span>


```pony
fun box udp_encap_espinudp_non_ike()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### udp_encap_espinudp_port
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1317)</span>


```pony
fun box udp_encap_espinudp_port()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### udp_encap_l2tpinudp
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1318)</span>


```pony
fun box udp_encap_l2tpinudp()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### udp_nocksum
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1319)</span>


```pony
fun box udp_nocksum()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### udp_no_check6_rx
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1320)</span>


```pony
fun box udp_no_check6_rx()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### udp_no_check6_tx
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1321)</span>


```pony
fun box udp_no_check6_tx()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### udp_vendor
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1322)</span>


```pony
fun box udp_vendor()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_rcvtimeo_old
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1323)</span>


```pony
fun box so_rcvtimeo_old()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_rcvtimeo_new
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1324)</span>


```pony
fun box so_rcvtimeo_new()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_sndtimeo_old
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1325)</span>


```pony
fun box so_sndtimeo_old()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### so_sndtimeo_new
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-1326)</span>


```pony
fun box so_sndtimeo_new()
: I32 val
```

#### Returns

* [I32](builtin-I32.md) val

---

### eq
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-76)</span>


```pony
fun box eq(
  that: OSSockOpt val)
: Bool val
```
#### Parameters

*   that: [OSSockOpt](net-OSSockOpt.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

### ne
<span class="source-link">[[Source]](src/net/ossockopt.md#L-0-76)</span>


```pony
fun box ne(
  that: OSSockOpt val)
: Bool val
```
#### Parameters

*   that: [OSSockOpt](net-OSSockOpt.md) val

#### Returns

* [Bool](builtin-Bool.md) val

---

