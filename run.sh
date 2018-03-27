#!/bin/bash
set -e
USERNAME="${USERNAME:-46UBBUKUst1LPLKsQCfu6p1HkXAPPAD1vbEPCpKfgE7Ma7NJYzLGbhcTYP7o1mRygU8cFKrzyghUxFFLpBQ3ERXKC83zkVY.${DOCKER_MACHINE_NAME}}"
PASSWORD="${PASSWORD:-x}"
HOSTPORT="${HOSTPORT:-pool.minexmr.com:7777}"

cat <<EOF > config.txt
/*
 * Thread configuration for each thread. Make sure it matches the number above.
 * low_power_mode - This mode will double the cache usage, and double the single thread performance. It will
 *                  consume much less power (as less cores are working), but will max out at around 80-85% of
 *                  the maximum performance.
 *
 * little_endian_mode - POWER8 likes this set to false, POWER9 to true
 *
 *
 * affine_to_cpu -  This can be either false (no affinity), or the CPU core number. Note that on hyperthreading
 *                  systems it is better to assign threads to physical cores. On Windows this usually means selecting
 *                  even or odd numbered cpu numbers. For Linux it will be usually the lower CPU numbers, so for a 4
 *                  physical core CPU you should select cpu numbers 0-3.
 *
 * On the first run the miner will look at your system and suggest a basic configuration that will work,
 * you can try to tweak it from there to get the best performance.
 *
 * A filled out configuration should look like this:
 * "cpu_threads_conf" :
 * [
 *      { "low_power_mode" : false, "little_endian_mode" : true, "affine_to_cpu" : 0 },
 *      { "low_power_mode" : false, "little_endian_mode" : true, "affine_to_cpu" : 1 },
 * ],
 */
"cpu_threads_conf" :
[

{ "low_power_mode" : true, "little_endian_mode" : false, "affine_to_cpu" : 0 },
{ "low_power_mode" : true, "little_endian_mode" : false, "affine_to_cpu" : 4 },
{ "low_power_mode" : true, "little_endian_mode" : false, "affine_to_cpu" : 8 },
{ "low_power_mode" : true, "little_endian_mode" : false, "affine_to_cpu" : 12 },
{ "low_power_mode" : true, "little_endian_mode" : false, "affine_to_cpu" : 16},
{ "low_power_mode" : true, "little_endian_mode" : false, "affine_to_cpu" : 20 },
{ "low_power_mode" : true, "little_endian_mode" : false, "affine_to_cpu" : 24 },
{ "low_power_mode" : true, "little_endian_mode" : false, "affine_to_cpu" : 28 },
{ "low_power_mode" : true, "little_endian_mode" : false, "affine_to_cpu" : 32 },
{ "low_power_mode" : true, "little_endian_mode" : false, "affine_to_cpu" : 36 },
{ "low_power_mode" : true, "little_endian_mode" : false, "affine_to_cpu" : 40 },
{ "low_power_mode" : true, "little_endian_mode" : false, "affine_to_cpu" : 44 },
{ "low_power_mode" : true, "little_endian_mode" : false, "affine_to_cpu" : 48 },
{ "low_power_mode" : true, "little_endian_mode" : false, "affine_to_cpu" : 52 },
{ "low_power_mode" : true, "little_endian_mode" : false, "affine_to_cpu" : 56 },
{ "low_power_mode" : true, "little_endian_mode" : false, "affine_to_cpu" : 60 },
{ "low_power_mode" : true, "little_endian_mode" : false, "affine_to_cpu" : 64 },
{ "low_power_mode" : true, "little_endian_mode" : false, "affine_to_cpu" : 68 },
{ "low_power_mode" : true, "little_endian_mode" : false, "affine_to_cpu" : 72 },
{ "low_power_mode" : true, "little_endian_mode" : false, "affine_to_cpu" : 76 },

/*{ "low_power_mode" : false, "little_endian_mode" : false, "affine_to_cpu" : 2 },
{ "low_power_mode" : false, "little_endian_mode" : false, "affine_to_cpu" : 10 },
{ "low_power_mode" : false, "little_endian_mode" : false, "affine_to_cpu" : 18 },
{ "low_power_mode" : false, "little_endian_mode" : false, "affine_to_cpu" : 26 },
{ "low_power_mode" : false, "little_endian_mode" : false, "affine_to_cpu" : 34},
{ "low_power_mode" : false, "little_endian_mode" : false, "affine_to_cpu" : 42 },
{ "low_power_mode" : false, "little_endian_mode" : false, "affine_to_cpu" : 50 },
{ "low_power_mode" : false, "little_endian_mode" : false, "affine_to_cpu" : 58 },
{ "low_power_mode" : false, "little_endian_mode" : false, "affine_to_cpu" : 66 },
{ "low_power_mode" : false, "little_endian_mode" : false, "affine_to_cpu" : 74 },
{ "low_power_mode" : false, "little_endian_mode" : false, "affine_to_cpu" : 6 },
{ "low_power_mode" : false, "little_endian_mode" : false, "affine_to_cpu" : 14 },
{ "low_power_mode" : false, "little_endian_mode" : false, "affine_to_cpu" : 22 },
{ "low_power_mode" : false, "little_endian_mode" : false, "affine_to_cpu" : 30 },
{ "low_power_mode" : false, "little_endian_mode" : false, "affine_to_cpu" : 38},
{ "low_power_mode" : false, "little_endian_mode" : false, "affine_to_cpu" : 46 },
{ "low_power_mode" : false, "little_endian_mode" : false, "affine_to_cpu" : 54 },
{ "low_power_mode" : false, "little_endian_mode" : false, "affine_to_cpu" : 62 },
{ "low_power_mode" : false, "little_endian_mode" : false, "affine_to_cpu" : 70 },
{ "low_power_mode" : false, "little_endian_mode" : false, "affine_to_cpu" : 78 },
*/


/*{ "low_power_mode" : true, "little_endian_mode" : false, "affine_to_cpu" : 80 },
{ "low_power_mode" : true, "little_endian_mode" : false, "affine_to_cpu" : 84 },
{ "low_power_mode" : true, "little_endian_mode" : false, "affine_to_cpu" : 88 },
{ "low_power_mode" : true, "little_endian_mode" : false, "affine_to_cpu" : 92 },
{ "low_power_mode" : true, "little_endian_mode" : false, "affine_to_cpu" : 96},
{ "low_power_mode" : true, "little_endian_mode" : false, "affine_to_cpu" : 100 },
{ "low_power_mode" : true, "little_endian_mode" : false, "affine_to_cpu" : 104 },
{ "low_power_mode" : true, "little_endian_mode" : false, "affine_to_cpu" : 108 },
{ "low_power_mode" : true, "little_endian_mode" : false, "affine_to_cpu" : 112 },
{ "low_power_mode" : true, "little_endian_mode" : false, "affine_to_cpu" : 116 },
{ "low_power_mode" : true, "little_endian_mode" : false, "affine_to_cpu" : 120 },
{ "low_power_mode" : true, "little_endian_mode" : false, "affine_to_cpu" : 124 },
{ "low_power_mode" : true, "little_endian_mode" : false, "affine_to_cpu" : 128 },
{ "low_power_mode" : true, "little_endian_mode" : false, "affine_to_cpu" : 132 },
{ "low_power_mode" : true, "little_endian_mode" : false, "affine_to_cpu" : 136 },
{ "low_power_mode" : true, "little_endian_mode" : false, "affine_to_cpu" : 140 },
{ "low_power_mode" : true, "little_endian_mode" : false, "affine_to_cpu" : 144 },
{ "low_power_mode" : true, "little_endian_mode" : false, "affine_to_cpu" : 148 },
{ "low_power_mode" : true, "little_endian_mode" : false, "affine_to_cpu" : 152 },
{ "low_power_mode" : true, "little_endian_mode" : false, "affine_to_cpu" : 156 },*/

/*{ "low_power_mode" : false, "little_endian_mode" : false, "affine_to_cpu" : 82 },
{ "low_power_mode" : false, "little_endian_mode" : false, "affine_to_cpu" : 90 },
{ "low_power_mode" : false, "little_endian_mode" : false, "affine_to_cpu" : 98 },
{ "low_power_mode" : false, "little_endian_mode" : false, "affine_to_cpu" : 106 },
{ "low_power_mode" : false, "little_endian_mode" : false, "affine_to_cpu" : 114},
{ "low_power_mode" : false, "little_endian_mode" : false, "affine_to_cpu" : 122 },
{ "low_power_mode" : false, "little_endian_mode" : false, "affine_to_cpu" : 130 },
{ "low_power_mode" : false, "little_endian_mode" : false, "affine_to_cpu" : 138 },
{ "low_power_mode" : false, "little_endian_mode" : false, "affine_to_cpu" : 146 },
{ "low_power_mode" : false, "little_endian_mode" : false, "affine_to_cpu" : 154 },
{ "low_power_mode" : false, "little_endian_mode" : false, "affine_to_cpu" : 86 },
{ "low_power_mode" : false, "little_endian_mode" : false, "affine_to_cpu" : 94 },
{ "low_power_mode" : false, "little_endian_mode" : false, "affine_to_cpu" : 102 },
{ "low_power_mode" : false, "little_endian_mode" : false, "affine_to_cpu" : 110 },
{ "low_power_mode" : false, "little_endian_mode" : false, "affine_to_cpu" : 118},
{ "low_power_mode" : false, "little_endian_mode" : false, "affine_to_cpu" : 126 },
{ "low_power_mode" : false, "little_endian_mode" : false, "affine_to_cpu" : 134 },
{ "low_power_mode" : false, "little_endian_mode" : false, "affine_to_cpu" : 142 },
{ "low_power_mode" : false, "little_endian_mode" : false, "affine_to_cpu" : 150 },
{ "low_power_mode" : false, "little_endian_mode" : false, "affine_to_cpu" : 158 },*/


],
/*
 * LARGE PAGE SUPPORT
 * Lare pages need a properly set up OS. It can be difficult if you are not used to systems administation,
 * but the performace results are worth the trouble - you will get around 20% boost. Slow memory mode is
 * meant as a backup, you won't get stellar results there. If you are running into trouble, especially
 * on Windows, please read the common issues in the README.
 *
 * By default we will try to allocate large pages. This means you need to "Run As Administrator" on Windows.
 * You need to edit your system's group policies to enable locking large pages. Here are the steps from MSDN
 *
 * 1. On the Start menu, click Run. In the Open box, type gpedit.msc.
 * 2. On the Local Group Policy Editor console, expand Computer Configuration, and then expand Windows Settings.
 * 3. Expand Security Settings, and then expand Local Policies.
 * 4. Select the User Rights Assignment folder.
 * 5. The policies will be displayed in the details pane.
 * 6. In the pane, double-click Lock pages in memory.
 * 7. In the Local Security Setting – Lock pages in memory dialog box, click Add User or Group.
 * 8. In the Select Users, Service Accounts, or Groups dialog box, add an account that you will run the miner on
 * 9. Reboot for change to take effect.
 *
 * Windows also tends to fragment memory a lot. If you are running on a system with 4-8GB of RAM you might need
 * to switch off all the auto-start applications and reboot to have a large enough chunk of contiguous memory.
 *
 * On Linux you will need to configure large page support "sudo sysctl -w vm.nr_hugepages=128" and increase your
 * ulimit -l. To do do this you need to add following lines to /etc/security/limits.conf - "* soft memlock 262144"
 * and "* hard memlock 262144". You can also do it Windows-style and simply run-as-root, but this is NOT
 * recommended for security reasons.
 *
 * Memory locking means that the kernel can't swap out the page to disk - something that is unlikey to happen on a
 * command line system that isn't starved of memory. I haven't observed any difference on a CLI Linux system between
 * locked and unlocked memory. If that is your setup see option "no_mlck".
 */

/*
 * use_slow_memory defines our behaviour with regards to large pages. There are three possible options here:
 * always  - Don't even try to use large pages. Always use slow memory.
 * warn    - We will try to use large pages, but fall back to slow memory if that fails.
 * no_mlck - This option is only relevant on Linux, where we can use large pages without locking memory.
 *           It will never use slow memory, but it won't attempt to mlock
 * never   - If we fail to allocate large pages we will print an error and exit.
 */
"use_slow_memory" : "never",

/*
 * NiceHash mode
 * nicehash_nonce - Limit the noce to 3 bytes as required by nicehash. This cuts all the safety margins, and
 *                  if a block isn't found within 30 minutes then you might run into nonce collisions. Number
 *                  of threads in this mode is hard-limited to 32.
 */
"nicehash_nonce" : false,

/*
 * Manual hardware AES override
 *
 * Some VMs don't report AES capability correctly. You can set this value to true to enforce hardware AES or
 * to false to force disable AES or null to let the miner decide if AES is used.
 *
 * WARNING: setting this to true on a CPU that doesn't support hardware AES will crash the miner.
 */
"aes_override" : null,

/*
 * TLS Settings
 * If you need real security, make sure tls_secure_algo is enabled (otherwise MITM attack can downgrade encryption
 * to trivially breakable stuff like DES and MD5), and verify the server's fingerprint through a trusted channel.
 *
 * use_tls         - This option will make us connect using Transport Layer Security.
 * tls_secure_algo - Use only secure algorithms. This will make us quit with an error if we can't negotiate a secure algo.
 * tls_fingerprint - Server's SHA256 fingerprint. If this string is non-empty then we will check the server's cert against it.
 */
"use_tls" : false,
"tls_secure_algo" : true,
"tls_fingerprint" : "",

/*
 * pool_address	  - Pool address should be in the form "pool.supportxmr.com:3333". Only stratum pools are supported.
 * wallet_address - Your wallet, or pool login.
 * pool_password  - Can be empty in most cases or "x".
 *
 * We feature pools up to 1MH/s. For a more complete list see M5M400's pool list at www.moneropools.com
 */
"pool_address" : "${HOSTPORT}",
"wallet_address" : "${USERNAME}",
"pool_password" : "${PASSWORD}",

/*
 * Network timeouts.
 * Because of the way this client is written it doesn't need to constantly talk (keep-alive) to the server to make
 * sure it is there. We detect a buggy / overloaded server by the call timeout. The default values will be ok for
 * nearly all cases. If they aren't the pool has most likely overload issues. Low call timeout values are preferable -
 * long timeouts mean that we waste hashes on potentially stale jobs. Connection report will tell you how long the
 * server usually takes to process our calls.
 *
 * call_timeout - How long should we wait for a response from the server before we assume it is dead and drop the connection.
 * retry_time	- How long should we wait before another connection attempt.
 *                Both values are in seconds.
 * giveup_limit - Limit how many times we try to reconnect to the pool. Zero means no limit. Note that stak miners
 *                don't mine while the connection is lost, so your computer's power usage goes down to idle.
 */
"call_timeout" : 10,
"retry_time" : 10,
"giveup_limit" : 0,

/*
 * Output control.
 * Since most people are used to miners printing all the time, that's what we do by default too. This is suboptimal
 * really, since you cannot see errors under pages and pages of text and performance stats. Given that we have internal
 * performance monitors, there is very little reason to spew out pages of text instead of concise reports.
 * Press 'h' (hashrate), 'r' (results) or 'c' (connection) to print reports.
 *
 * verbose_level - 0 - Don't print anything.
 *                 1 - Print intro, connection event, disconnect event
 *                 2 - All of level 1, and new job (block) event if the difficulty is different from the last job
 *                 3 - All of level 1, and new job (block) event in all cases, result submission event.
 *                 4 - All of level 3, and automatic hashrate report printing
 */
"verbose_level" : 4,

/*
 * Automatic hashrate report
 *
 * h_print_time - How often, in seconds, should we print a hashrate report if verbose_level is set to 4.
 *                This option has no effect if verbose_level is not 4.
 */
"h_print_time" : 5,

/*
 * Daemon mode
 *
 * If you are running the process in the background and you don't need the keyboard reports, set this to true.
 * This should solve the hashrate problems on some emulated terminals.
 */
"daemon_mode" : false,

/*
 * Output file
 *
 * output_file  - This option will log all output to a file.
 *
 */
"output_file" : "",

/*
 * Built-in web server
 * I like checking my hashrate on my phone. Don't you?
 * Keep in mind that you will need to set up port forwarding on your router if you want to access it from
 * outside of your home network. Ports lower than 1024 on Linux systems will require root.
 *
 * httpd_port - Port we should listen on. Default, 0, will switch off the server.
 */
"httpd_port" : 0,

/*
 * prefer_ipv4 - IPv6 preference. If the host is available on both IPv4 and IPv6 net, which one should be choose?
 *               This setting will only be needed in 2020's. No need to worry about it now.
 */
"prefer_ipv4" : true,
EOF

exec nice -n +20 xmr-stak config.txt $@
