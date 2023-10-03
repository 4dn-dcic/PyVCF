import vcf

def test_version():

    version = vcf.VERSION
    assert isinstance(version, str)
    version_major = int(version.split('.')[0])
    assert version_major > 2
