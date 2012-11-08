import re
from distutils.core import setup
from distutils.extension import Extension
from Cython.Distutils import build_ext

__version__ = re.search("__version__\s*=\s*'(.*)'",
                        open('shm_stat.pyx').read(), re.M).group(1)
assert __version__

setup(
    name='shm_stat',
    version=__version__,
    description='SHM_STAT, SHM_INFO shared memory control commands',
    author='Artem Egorkine',
    author_email='arteme@gmail.com',
    url='https://github.com/arteme/shm_stat',
    cmdclass={'build_ext': build_ext},
    ext_modules=[Extension("shm_stat", ["shm_stat.pyx"])],
    install_requires=['cython'],
    classifiers=[
        "Development Status :: 3 - Alpha",
        "Intended Audience :: Developers",
        "License :: OSI Approved :: MIT License",
        "Operating System :: POSIX :: Linux",
        "Programming Language :: Python",
        "Topic :: Software Development :: Libraries :: Python Modules",
        "Topic :: Utilities",
    ]
)

