from libc.stdlib cimport *

cdef extern from "shm.h":

    int IPC_INFO
    int SHM_INFO
    int SHM_STAT

    #ctypedef signed int key_t
    ctypedef unsigned int uid_t
    ctypedef unsigned int gid_t
    ctypedef signed int pid_t
    ctypedef unsigned long shmatt_t

    cdef struct ipc_perm:
        #key_t __key
        uid_t uid
        gid_t gid
        unsigned short mode
        #unsigned short __seq

    cdef struct shmid_ds:
        ipc_perm shm_perm
        size_t shm_segsz
        size_t shm_atime
        size_t shm_dtime
        size_t shm_ctime
        pid_t shm_cpid
        pid_t shm_lpid
        shmatt_t shm_nattch

    cdef struct shminfo:
        unsigned long shmmax
        unsigned long shmmin
        unsigned long shmmni
        unsigned long shmseg
        unsigned long shmall

    cdef struct shm_info:
        int used_ids
        unsigned long shm_tot
        unsigned long shm_rss
        unsigned long shm_swp
        unsigned long swap_attempts
        unsigned long swap_successes

    int shmctl(int shmid, int cmd, shmid_ds *buf)
