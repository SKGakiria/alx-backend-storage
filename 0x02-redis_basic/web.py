#!/usr/bin/env python3
"""Module containing tools for request tracking and caching"""
import redis
import requests
from functools import wraps
from typing import Callable
