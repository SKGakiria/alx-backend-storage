#!/usr/bin/env python3
"""Module containing function that inserts a new doc in a collection
based on kwargs"""
import pymongo


def insert_school(mongo_collection, **kwargs):
    """Function returns the new ID"""
    return mongo_collection.insert_one(kwargs).inserted_id
