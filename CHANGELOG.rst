=========
dcicpyvcf
=========

----------
Change Log
----------


3.0.0
=====

* Convert to poetry
* Use GitHub Actions workflows for testing versions, removing tox.
* Testing improvements and bug fixes to make pytest work.
* PEP8


2.0.0
=====

`PR 1: Convert 2 syntax to 3 (C4-801) <https://github.com/4dn-dcic/PyVCF/pull/1>`_

Version to be merged to ``master`` and released to PyPi as version ``2.0.0``
on October 4, 2023. Essentially unchanged since ``1.0.0.1b0`` except:

* The non-beta version reflects its successful use for a period of time.

* New major version reflects dropping of Python 2 support on branch ``master``,
  but there is no other breaking change we know of.

* Added a ``CHANGELOG.rst`` file, which you are reading now.


1.0.0.1b0
=========

`PR 1: Convert 2 syntax to 3 (C4-801) <https://github.com/4dn-dcic/PyVCF/pull/1>`_

Beta version ``1.0.0.1b0`` released to PyPi on February 21, 2023 but not yet merged to branch ``master``.

* Applied ``2to3`` changes to version ``1.0.0``
  so that it could run with higher than ``setuptools==57.5.0``
  (and, more generally, more modern versions of Python).

* This version was used successfully in this beta form
  in the production CGAP portal
  as recently as ``cgap-portal==14.3.1``.


1.0.0
=====

* Version of May, 2020.

  Details not documented but this is the first post-fork release.

Older Versions
==============

A record of older changes, before we forked, can be found in GitHub at
`James Casbon's PyVCF repository <https://github.com/jamescasbon/PyVCF/pulls?q=is%3Apr+is%3Aclosed>`_.
