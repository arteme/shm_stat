cimport shm

__version__ = '0.1'

def get_shm_info():

    cdef shm.shm_info info
    cdef int maxid

    maxid = shm.shmctl(0, shm.SHM_INFO, <shm.shmid_ds*><void*>&info)
    if maxid < 0:
        return -1, None

    return maxid, info

def get_ipc_info():

    cdef shm.shminfo info
    cdef int maxid

    maxid = shm.shmctl(0, shm.IPC_INFO, <shm.shmid_ds*><void*>&info)
    if maxid < 0:
        return -1, None

    return maxid, info

def get_shm_stat(int id):

    cdef shm.shmid_ds info
    cdef int shmid

    shmid = shm.shmctl(id, shm.SHM_STAT, &info)
    if shmid < 0:
        return -1, None

    return shmid, info



