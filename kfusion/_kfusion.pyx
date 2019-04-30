# cimport numpy as np
from kfusion cimport _kfusion_defs as defs

from cython.operator cimport dereference


cdef class KFusionConfig:

    cdef defs.KFusionConfig *config

    def __cinit__(self):
        self.config = new defs.KFusionConfig()

    @property
    def volume_size(self):
        size = self.config.volumeSize
        return size.x, size.y, size.z

    @volume_size.setter
    def volume_size(self, tuple value):
        self.config.volumeSize = defs.make_uint3(value[0], value[1], value[2])


cdef class KFusion:

    cdef defs.KFusion *kfusion

    def __cinit__(self, KFusionConfig config):
        self.kfusion = new defs.KFusion()
        self.kfusion.Init(dereference(config.config))
#
#     # def set_depth(self, np.ndarray[np.floating, ndim=2] depth):
#     #     self.kfusion.setDepth(depth)
