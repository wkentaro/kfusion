cdef extern from "vector_types.h":
    ctypedef struct uint3:
        unsigned int x, y, z
    ctypedef struct dim3:
        pass

cdef extern from "cutil_math.h":
    cdef uint3 make_uint3(unsigned int x, unsigned int y, unsigned int z)

cdef extern from "kfusion.h":
    cdef cppclass KFusionConfig:
        uint3 volumeSize
    cdef cppclass KFusion:
        void Init( const KFusionConfig & config )
