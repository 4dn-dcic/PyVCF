import glob
import io

from setuptools import setup
from distutils.extension import Extension

try:
    from Cython.Distutils import build_ext  # noQA - Might be this won't exist, no warning from PyCharm required
    CYTHON = True
except Exception:
    CYTHON = False

DEPENDENCIES = []
for filename in glob.glob("requirements/*requirements*.txt"):
    with io.open(filename) as f:
        DEPENDENCIES += f.read().splitlines()

# get the version without an import
VERSION = "Undefined"
DOC = ""
inside_doc = False
for line in io.open('vcf/__init__.py'):
    if "'''" in line:
        inside_doc = not inside_doc
    if inside_doc:
        DOC += line.replace("'''", "")

    if line.startswith('VERSION'):
        exec(line.strip())

extras = {}
if CYTHON:
    extras['cmdclass'] = {'build_ext': build_ext}
    extras['ext_modules'] = [Extension("vcf.cparse", ["vcf/cparse.pyx"])]

setup(
    name='dcicpyvcf',
    packages=['vcf', 'vcf.test'],
    scripts=['scripts/vcf_melt', 'scripts/vcf_filter.py',
             'scripts/vcf_sample_filter.py'],
    author='Will Ronchetti',
    author_email='william_ronchetti@hms.harvard.edu',
    description='Variant Call Format (VCF) parser for Python',
    long_description=DOC,
    test_suite='vcf.test.test_vcf.suite',
    install_requires=DEPENDENCIES,
    entry_points={
        'vcf.filters': [
            'site_quality = vcf.filters:SiteQuality',
            'vgq = vcf.filters:VariantGenotypeQuality',
            'eb = vcf.filters:ErrorBiasFilter',
            'dps = vcf.filters:DepthPerSample',
            'avg-dps = vcf.filters:AvgDepthPerSample',
            'snp-only = vcf.filters:SnpOnly',
        ]
    },
    url='https://github.com/4dn-dcic/PyVCF',
    version=VERSION,
    classifiers=[
        'Development Status :: 4 - Beta',
        'Intended Audience :: Developers',
        'Intended Audience :: Science/Research',
        'License :: OSI Approved :: BSD License',
        'License :: OSI Approved :: MIT License',
        'Operating System :: OS Independent',
        'Programming Language :: Cython',
        'Programming Language :: Python',
        'Programming Language :: Python :: 3',
        'Programming Language :: Python :: 3.7',
        'Programming Language :: Python :: 3.8',
        'Programming Language :: Python :: 3.9',
        'Programming Language :: Python :: Implementation :: CPython',
        'Programming Language :: Python :: Implementation :: PyPy',
        'Topic :: Scientific/Engineering :: Bio-Informatics',
      ],
    keywords='bioinformatics',
    include_package_data=True,
    package_data={
        '': ['*.vcf', '*.gz', '*.tbi'],
        },
    python_requires='>=3.7,<3.10',
    **extras
)
