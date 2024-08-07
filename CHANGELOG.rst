=========
dcicpyvcf
=========

----------
Change Log
----------


3.1.0
=====
* Support Python 3.12.


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

* Changed the "classifiers" in ``setup.py`` to mention Python version 3.8
  explicitly, dropping mention of earlier versions. In fact, it may work
  with later versions. There's not yet a GitHub Action (GA) test
  to confirm compliance anyway, so support here is fuzzy. We just believe
  the change to remove need for ``2to3`` support will help with more modern
  versions generally.

* Beefed up the ``.gitignore``

* Updated ``LICENSE`` (renaming to ``LICENSE.txt``)
  in a form compatible with prior licenses that adds our own
  copyright claims and clarifies the nature of the license as a standard
  3-Clause BSD License.


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

* Version of May, 2020, forked from version ``0.6.8`` of
  `James Casbon's PyVCF repository <https://github.com/jamescasbon/PyVCF>`_,
  which, according to its license,
  seems in turn seems to build on earlier work by
  John Dougherty. We are grateful for these
  open source contributions to build from.

  This version is essentially unchanged from where
  we forked it from other than
  to adjust version numbers, repository name, and
  maintainer information to suit our own needs.


Older Versions
==============

A record of older changes, before we forked, can be found in GitHub at
`James Casbon's PyVCF repository <https://github.com/jamescasbon/PyVCF/pulls?q=is%3Apr+is%3Aclosed>`_.
