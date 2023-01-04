import React from "react"
import { Link } from "react-router-dom/cjs/react-router-dom.min";

const Author = (cell) => {
    return (
        <div className="avatar-group">
            {cell.value.map((item, index) => (
                <Link key={index} to="#" className="avatar-group-item" data-bs-toggle="tooltip" data-bs-trigger="hover" data-bs-placement="top" title="Alexis">
                    <img src={item.img} alt="" className="rounded-circle avatar-xxs" />
                </Link>
            ))}
        </div>
    );
}

export { Author }