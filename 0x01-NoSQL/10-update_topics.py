#!/usr/bin/env python3
"""Module containing function that changes all topics of a school
document based on the name"""
import pymongo


def update_topics(mongo_collection, name, topics):
    """Function returns updated school document"""
    return mongo_collection.update_many(
        {"name": name},
        {"$set": {"topics": topics}})
