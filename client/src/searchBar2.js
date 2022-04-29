import { useState, useEffect } from "react";
import { useHistory } from "react-router-dom";

export default function SearchBar(props) {
    const [searchTerm, setSearchTerm] = useState();
    const [users, setSets] = useState();
    const history = useHistory();

    useEffect(() => {
        if (!searchTerm) {
            console.log("all sets");
            fetch("/searchBar")
                .then((res) => res.json())
                .then(({ rows }) => {
                    setSets(rows);
                });
        } else {
            let abort;
            fetch(`/searchBar/${searchTerm}`)
                .then((res) => res.json())
                .then(({ rows }) => {
                    if (!abort) {
                        console.log("this are users", users);
                        setSets(rows);
                    }
                });
            return () => (abort = true);
        }
    }, [searchTerm]);

    return (
        <div id={"findPeople"}>
            <input
                className="searchQuery"
                placeholder="Type a search query"
                onChange={(e) => {
                    setSearchTerm(e.target.value);
                }}
            />
            <div className="setsHome">
                {props.sets &&
                    props.sets.map((set) => (
                        <div key={set.id}>
                            <div
                                className="setHome"
                                onClick={() =>
                                    props.updateSelectedState(set.id)
                                }
                            >
                                <img
                                    src={"/rosa7.png"}
                                    height={180}
                                    width={190}
                                />
                                <p>{set.name}</p>
                            </div>
                        </div>
                    ))}
            </div>
        </div>
    );
}
